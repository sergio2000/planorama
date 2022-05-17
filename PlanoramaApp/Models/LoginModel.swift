//
//  LoginModel.swift
//  Planorama
//
//  Created by Sergio Acosta on 4/18/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth
import LocalAuthentication
import FirebaseFirestoreSwift

class AppViewModel: ObservableObject{

    @Published var events = [Event]()
    
    @Published var dataToDisplay : String = ""
    @Published var first: String = ""
    @Published var last: String = ""
    @Published var email: String = ""
    
    private var db = Firestore.firestore()
    
//    let userId = Auth.auth().currentUser?.uid
    @Published var authorizationError: Error?
        

    
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func requestBiometricUnlock(email: String, password: String) {
            let context = LAContext()
            
            var error: NSError? = nil
            
            let canEvaluate = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
            
            if canEvaluate {
                if context.biometryType != .none {
                    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We need to unlock your data") { (success, error) in
                        self.signIn(email: email, password: password)
                    }
                }
            }
        }
    func signIn(email:String, password: String) {
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.signedIn = true
            }
            
        }
    }
    func signUp(email:String, password: String, firstName: String, lastName: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            self?.createUserProfile(first: firstName,last: lastName, email: email)
            DispatchQueue.main.async {
                self?.signedIn = true
            }    }

}
    func createUserProfile(first: String, last: String, email: String) {
    guard let userID = Auth.auth().currentUser?.uid else { return }

    db.collection("profiles").document(userID).setData([
                "first": first,
                "last": last,
                "email": email,
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
    }

    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
    
//    func fetchData() {
//        guard let userID = Auth.auth().currentUser?.uid else { return }
//        print(userID)
//            db.collection("profiles").document(userID).getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                let fieldValue = document.get("first name") as? String
//                self.name = fieldValue!
//                self.dataToDisplay = dataDescription
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
    
    func addData(name: String, notes: String, phone:String, city:String, date: Date, rating: Double, longitude: Double, latitude: Double, image: String) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
           do {
               _ = try db.collection(userID).addDocument(data: ["name": name, "notes": notes, "date": date, "rating": rating, "longitude": longitude, "latitude": latitude, "image": image, "phone": phone, "city": city])
           }
           catch {
               print(error.localizedDescription)
           }
       }

    func fetchData() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
            db.collection(userID)
            .order(by: "date", descending: false)
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                self.events = documents.map { (queryDocumentSnapshot) -> Event in
                    let data = queryDocumentSnapshot.data()
                    let name = data["name"] as? String ?? ""
                    let notes = data["notes"] as? String ?? ""
                    let date = data["date"] as? Date
                    let rating = data["rating"] as? Double ?? 0.0
                    let longitude = data["longitude"] as? Double ?? 0.0
                    let latitude = data["latitude"] as? Double ?? 0.0
                    let image_url = data["image"] as? String ?? ""
                    let phone = data["phone"] as? String ?? ""
                    let city = data["city"] as? String ?? ""
                    return Event(name: name, phone: phone, city: city, notes: notes, rating: rating, date: date, longitude: longitude, latitude: latitude, image: image_url)
                }
            }
        }
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()

        let docRef = db.collection("profiles").document(userID)

        docRef.getDocument { (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.first = data["first"] as? String ?? ""
                    self.last = data["last"] as? String ?? ""
                    self.email = data["email"] as? String ?? ""
                }
            }

        }
    }

    
}
