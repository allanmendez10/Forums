//
//  ViewController.swift
//  Lab4_Foros
//
//  Created by Allan Cordero Mendez on 7/25/20.
//  Copyright © 2020 Allan Cordero Mendez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    private var forumViewModel : ForumViewModel!
    
    private var dataSource : TableViewDataSourceUtil<ForumTableViewCell,Forum>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        
        self.forumViewModel =  ForumViewModel()
        self.forumViewModel.bindForumViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        
        self.dataSource = TableViewDataSourceUtil(cellIdentifier: "forumIdentifier", items: self.forumViewModel.empData, configureCell: { (cell, evm) in
            cell.lblTitle.text = evm.title
        })
        
        self.dataSource.delegate = self
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.delegate =  self.dataSource
            self.tableView.reloadData()
        }
        
    }
        
    func goToComments(forum:Forum){
        
        let vc = UIStoryboard.init(name: "Main", bundle:Bundle.main).instantiateViewController(withIdentifier: "commentViewController") as? CommentsViewController
                  vc?.forumSelected = forum
                   self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    
}


extension ViewController :ForumProtocol{
    func didSelectForum(object: Any) {
        goToComments(forum: object as! Forum)
    }
    
}




