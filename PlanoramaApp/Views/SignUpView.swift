//
//  SignUpView.swift
//  Planorama
//
//  Created by Sergio Acosta on 4/18/22.
//

import SwiftUI
import Firebase
import FirebaseAuth
struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @State var firstName = ""
    @State var lastName = ""
    let userID = Auth.auth().currentUser?.uid
    @EnvironmentObject var viewModel: AppViewModel
    let auth = Auth.auth()
    

    var body: some View {
        NavigationView{
             VStack {
//                 Image("logo")
//                     .resizable()
//                     .scaledToFit()
//                     .frame(width: 200, height: 200)
                 VStack {
                     TextField("First Name", text: $firstName)
                         .padding()
                         .disableAutocorrection(true)
                         .background(Color(.secondarySystemBackground))
                     TextField("Last Name", text: $lastName)
                         .padding()
                         .disableAutocorrection(true)
                         .background(Color(.secondarySystemBackground))
                     TextField("Email Address", text: $email)
                         .padding()
                         .disableAutocorrection(true)
                         .autocapitalization(.none)
                         .background(Color(.secondarySystemBackground))
                     
                     SecureField("Password", text: $password)
                         .padding()
                         .background(Color(.secondarySystemBackground))
                     Button(action: {
                         guard !email.isEmpty, !password.isEmpty else {
                             return
                         }
                         viewModel.signUp(email: email, password: password, firstName: firstName, lastName: lastName)
                     }, label: {
                         Text("Create Account")
                             .foregroundColor(Color.white)
                             .frame(width: 200, height: 50)
                             .background(Color.cyan)
                             .cornerRadius(10)
                     })
                     .padding()
                 }
                 .padding()
                 Spacer()
             }
             .navigationTitle("Create Account")
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
