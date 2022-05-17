//
//  ApiModel.swift
//  Planorama
//
//  Created by Sergio Acosta on 4/21/22.
//

import Foundation

class ApiCall: ObservableObject {
//    save results from API into results
    @Published var results = [Business]()
    
    let apiKey = "fzQPKaOC5t55_8eftFK_fbscGf_Sy27mO6gQHOHT4a4eqMXNnq0HSeNM5H0nQ9bTzgPMTG09wPMBGT31kqRaKKhDE-VHU2ZPH-OmRxsukkaSHuRd5dd6l5dc3ohAYnYx"

    
    func loadData(categories: String, term: String, loc: String) {
            guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?location=\(loc)&categories=\(categories)&limit=50&term=\(term)") else {
                print("Invalid URL")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
        
            request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode(SearchResult.self, from: data) {
                        DispatchQueue.main.async {
                          
                            self.results = response.businesses
                            
                        }
                        return
                    }
                }
            }.resume()
        }
    

}
