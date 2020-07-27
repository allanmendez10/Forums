//
//  ForumViewModel.swift
//  Lab4_Foros
//
//  Created by Allan Cordero Mendez on 7/26/20.
//  Copyright © 2020 Allan Cordero Mendez. All rights reserved.
//

import UIKit

class ForumViewModel: NSObject {

    
    private var repository : ForumRepository!
    private(set) var empData : [Forum]! {
        didSet {
            self.bindForumViewModelToController()
        }
    }
    
    var bindForumViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.repository = ForumRepository()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.repository.getForums{ (empData) in
            self.empData = empData
        }
    }
    
}

