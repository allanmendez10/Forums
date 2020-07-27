//
//  CommentsViewController.swift
//  Lab4_Foros
//
//  Created by Allan Cordero Mendez on 7/26/20.
//  Copyright © 2020 Allan Cordero Mendez. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    
    var forumSelected:Forum?
    private var commentViewModel:CommentViewModel?
    
    private var dataSource : TableViewDataSourceUtil<CommentTableViewCell,Comment>!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        
        // Do any additional setup after loading the view.
    }
    
    func fillData()  {
        self.commentViewModel =  CommentViewModel()
        
        if let forum = self.forumSelected {
            
            lblTitle.text =  "Título: \(forum.title)"
            lblBody.text = "Descripción:\(forum.body)"
            self.commentViewModel?.callFuncToGetEmpData(id: forum.id)
            
        }
        
        self.commentViewModel!.bindCommentViewModelToController = {
            self.updateDataSource()
        }
    }
    
    
    
    func updateDataSource(){
        
        
        self.dataSource = TableViewDataSourceUtil(cellIdentifier: "commentCellIdentifier", items: self.commentViewModel?.empData, configureCell: { (cell, evm) in
            cell.lblName.text = "Nombre: \(evm.name)"
            cell.lblEmail.text = "Email: \(evm.email)"
            cell.lblContent.text = "Mensaje: \(evm.body)"
        })
        
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
        
    }
    
    
}
