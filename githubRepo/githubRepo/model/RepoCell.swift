//
//  RepoCell.swift
//  githubRepo
//
//  Created by Reza Farahani on 24/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var repoName: UILabel!
    
    @IBOutlet weak var leftNavImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        leftNavImage.tintColor = .lightGray
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
