//
//  SignInView.swift
//  Planorama
//
//  Created by Sergio Acosta on 4/18/22.
//

import SwiftUI

struct SignInView: View {
    @State var email = ""
    @State var password = ""

    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView {
             VStack {
                 Image("logo")
                     .resizable()
                     .scaledToFit()
                     .frame(width: 200, height: 200)
                 VStack {
                     TextField("Email Address", text: $email)
                         .padding()
                         .disableAutocorrection(true)
                         .autocapitalization(.none)
                         .background(Color(.secondarySystemBackground))
                     
                     SecureField("Password", text: $password)
                         .padding()
                         .background(Color(.secondarySystemBackground))
                     HStack {
                     Button(action: {
                         guard !email.isEmpty, !password.isEmpty else {
                             return
                         }
                         viewModel.signIn(email: email, password: password)
                     }, label: {
                         Text("Sign In")
                             .foregroundColor(Color.white)
                             .frame(width: 170, height: 50)
                             .background(Color.cyan)
                             .cornerRadius(10)
                     })
                    
                     Button(action: {
                         guard !email.isEmpty, !password.isEmpty else {
                             return
                         }
                         viewModel.requestBiometricUnlock(email: email, password: password)
                     }, label: {
                         
                             Label("Face ID",systemImage: "faceid")
                             .foregroundColor(Color.white)
                             .frame(width: 170, height: 50)
                             .background(Color.green)
                             .cornerRadius(10)
                             
                     })
                     }.padding()
                     NavigationLink("Create Account", destination: SignUpView())
                         .padding()
                 }
                 .padding()
                 Spacer()
             }
             .navigationTitle("Sign In")
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
