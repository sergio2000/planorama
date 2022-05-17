//
//  ProfileView.swift
//  Itinerary App
//
//  Created by Sergio Acosta on 4/21/22.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    let auth = Auth.auth()
    var body: some View {
        VStack {
            CircleImage(image_url: "https://blog.cpanel.com/wp-content/uploads/2019/08/user-01.png")
            VStack(alignment: .leading) {
                Text("First Name: \(viewModel.first)")
                .font(.title3)
                .foregroundColor(.gray)
            Divider()
                Text("Last Name: \(viewModel.last)")
                .font(.title3)
                .foregroundColor(.gray)
            Divider()
                Text("Email: \(viewModel.email)")
                .font(.title3)
                .foregroundColor(.gray)

            }.padding()
            HStack {
        Button(action: {
            viewModel.signOut()
        }, label: {

            Text("Sign Out")
                .padding()
                .foregroundColor(Color.white)
                .background(Color.cyan)
                .cornerRadius(10)
        })
            }
    
    }.onAppear(perform: viewModel.fetchUser)
        Spacer()

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
