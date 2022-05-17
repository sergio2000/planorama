//
//  ItineraryCard.swift
//  Planorama
//
//  Created by Sergio Acosta on 5/8/22.
//

import SwiftUI

struct ItineraryCard: View {
    var image_url: String
    var name: String
    var rating: Double
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: image_url)) { image in
                image
                    .resizable()
            } placeholder: {
                Color.purple.opacity(0.1)
            }
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(5)
            VStack(alignment:.leading) {
                Text(name.prefix(25))
                switch rating {
                case 0.0:
                    Image("regular_0")
                case 1.0:
                    Image("regular_1")
                case 1.5:
                    Image("regular_1_half")
                case 2.0:
                    Image("regular_2")
                case 2.5:
                    Image("regular_2_half")
                case 3.0:
                    Image("regular_3")
                case 3.5:
                    Image("regular_3_half")
                case 4.0:
                    Image("regular_4")
                case 4.5:
                    Image("regular_4_half")
                case 5.0:
                    Image("regular_5")
                default:
                    Image("regular_0")

                }
                
            }
            .padding()
    }
    }
}

struct ItineraryCard_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryCard(image_url: "https://static01.nyt.com/images/2021/01/14/arts/14wandavision-1/14wandavision-1-mediumSquareAt3X.jpg", name: "Colessuem", rating: 5.6)
    }
}
