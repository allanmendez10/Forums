//
//  Comment.swift
//  Lab4_Foros
//
//  Created by Allan Cordero Mendez on 7/26/20.
//  Copyright © 2020 Allan Cordero Mendez. All rights reserved.
//

import Foundation


struct Comment :Decodable{
    
    let name,email, body: String
    let postId,id : Int
}
