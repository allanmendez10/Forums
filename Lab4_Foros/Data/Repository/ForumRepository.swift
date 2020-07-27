//
//  ForumRepository.swift
//  Lab4_Foros
//
//  Created by Allan Cordero Mendez on 7/26/20.
//  Copyright © 2020 Allan Cordero Mendez. All rights reserved.
//

import Foundation

class ForumRepository : NSObject {

   var session:URLSession?
   var service:ManagerService?
    
    override init() {
        self.service = ManagerService.getInstance()
        self.session = URLSession.shared

    }
    
    func getForums(completion : @escaping ([Forum]) -> ()){
         
        self.session?.dataTask(with: (service?.execute(path: "posts", httpMethod: .get))!) { (data, urlResponse, error) in
            
            if let newData = data {
                 
                 let jsonDecoder = JSONDecoder()
                                
                 let empData = try! jsonDecoder.decode([Forum].self, from: newData)
             
                     completion(empData)
             }
             
         }.resume()
     }
    
    func getComments(idPost:Int,completion : @escaping ([Comment]) -> ()){
         
        self.session?.dataTask(with: (service?.execute(path: "posts/\(idPost)/comments", httpMethod: .get))!) { (data, urlResponse, error) in
            
            if let newData = data {
                 
                 let jsonDecoder = JSONDecoder()
                                
                 let empData = try! jsonDecoder.decode([Comment].self, from: newData)
             
                     completion(empData)
             }
             
         }.resume()
     }
    
}
