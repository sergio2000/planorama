//
//  ContentView.swift
//  Planorama
//  if user is authenticated, go to Home Page otherwise stay on signIn/Up page.
//  Created by Sergio Acosta on 4/18/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    
    var body: some View {
        VStack {
            if viewModel.isSignedIn {
                
                TabView2()
                
            } else {
                SignInView()
            }
        }
        
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
