//
//  ManagerService.swift
//  Lab4_Foros
//
//  Created by Allan Cordero Mendez on 7/26/20.
//  Copyright © 2020 Allan Cordero Mendez. All rights reserved.
//

import UIKit

class  ManagerService: NSObject {

    private let sourcesURL = "https://jsonplaceholder.typicode.com/"
    static var instance: ManagerService?

    
   static func getInstance()->ManagerService?{
        
        if let inst = self.instance{
            return inst
        }else{
            self.instance = ManagerService()
        }
         
        return self.instance
    }
    
    func execute(path:String, httpMethod:HttpCode, httpRequestParams:[String:String]? = nil)->URLRequest! {
        var request = URLRequest(url: URL(string: self.sourcesURL + path)!)
          request.httpMethod = httpMethod.description
        
           if let params = httpRequestParams {
               for param in params {
                   request.setValue(param.value, forHTTPHeaderField: param.key)
               }
           }
        
        return request
    }
    
    
}
