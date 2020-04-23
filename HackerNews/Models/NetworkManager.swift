//
//  File.swift
//  HackerNews
//
//  Created by Ángeles Vázquez Parra on 23/04/2020.
//  Copyright © 2020 Ángeles Vázquez Parra. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
         
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url){ (data, response, error) in
                if (error == nil){
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                           let result = try decoder.decode(PostData.self, from: safeData)
                            DispatchQueue.main.async{
                                self.posts = result.hits
                            }
                        }catch{
                            print(error)
                        }
                    }
                }else{
                   print(error)
                }
            }
            task.resume()
        }
    }
}
