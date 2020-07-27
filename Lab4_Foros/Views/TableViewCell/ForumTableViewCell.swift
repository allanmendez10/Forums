//
//  ForumTableViewCell.swift
//  Lab4_Foros
//
//  Created by Allan Cordero Mendez on 7/26/20.
//  Copyright © 2020 Allan Cordero Mendez. All rights reserved.
//

import UIKit

class ForumTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblTitle: UILabel!
    
    
    var forum : Forum? {
        didSet {
            lblTitle.text = forum?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
