//
//  HttpCode.swift
//  Lab4_Foros
//
//  Created by Allan Cordero Mendez on 7/26/20.
//  Copyright © 2020 Allan Cordero Mendez. All rights reserved.
//

import Foundation

enum HttpCode: CustomStringConvertible {
    case get
    case put
    case delete
    case post
    
    var description: String {
        switch self {
        case .get:
            return "GET"
        case .delete:
            return "DELETE"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        default:
            return "GET"
        }
    }
}
