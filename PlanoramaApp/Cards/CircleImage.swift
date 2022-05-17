//
//  CircleImage.swift
//  Landmarks
//
//  Created by Sergio Acosta on 4/2/22.
//

import SwiftUI

import SwiftUI

struct CircleImage: View {
    var image_url: String
 
    var body: some View {
        HStack(alignment: .top) {

            AsyncImage(url: URL(string: image_url)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.purple.opacity(0.1)
            }
            .frame(width: 200, height: 200)
            .cornerRadius(5)
            .scaledToFill()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
    
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image_url: "https://m.media-amazon.com/images/M/MV5BNWM0ZGJlMzMtZmYwMi00NzI3LTgzMzMtNjMzNjliNDRmZmFlXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_UY1200_CR90,0,630,1200_AL_.jpg")
    }
}
