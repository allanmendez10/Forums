//
//  TableViewCellUtil.swift
//  Lab4_Foros
//
//  Created by Allan Cordero Mendez on 7/26/20.
//  Copyright © 2020 Allan Cordero Mendez. All rights reserved.
//

import UIKit

class TableViewDataSourceUtil <CELL : UITableViewCell,T> : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    var delegate:ForumProtocol?

    
    init(cellIdentifier : String, items : [T]?, configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let delegate = self.delegate{
            delegate.didSelectForum(object: self.items[indexPath.row])
        }
    
    }
    
    
}
