//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Hsueh Chih Liu on 2019/12/12.
//  Copyright © 2019 Luke Liu. All rights reserved.
//
//git practice
// now in branch
import Foundation
//observableobject means it can be boarcasted to the .... object?
class NetworkManager : ObservableObject{
    //initialize the post object
    @Published var posts = [Post]()
    //@published means can be listedn to see if anything change
    
    func fetchData() {
        if let url = URL(string:"https://hn.algolia.com/api/v1/search?tags=front_page"){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self , from: safeData)
                            //because it takes time
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                            
                        } catch{
                            print(error.localizedDescription)
                        }
                        
                    }
                    
                }
            }
            task.resume()
            
            
            
        }
        
        
        
    }
    
    
    
}
