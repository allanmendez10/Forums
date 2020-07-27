//
//  CommentViewModel.swift
//  Lab4_Foros
//
//  Created by Allan Cordero Mendez on 7/27/20.
//  Copyright © 2020 Allan Cordero Mendez. All rights reserved.
//

import UIKit

class CommentViewModel: NSObject {
    
    private var repository : ForumRepository!
    private(set) var empData : [Comment]! {
        didSet {
            self.bindCommentViewModelToController()
        }
    }
    
    var bindCommentViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.repository = ForumRepository()
        //callFuncToGetEmpData(id: id)
    }
    
    func callFuncToGetEmpData(id:Int) {

        self.repository.getComments(idPost: id) { (data) in
            self.empData = data

        }
    }
    
    

}
