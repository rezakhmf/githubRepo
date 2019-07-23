//
//  UserRepoVC.swift
//  githubRepo
//
//  Created by Qantas Dev on 23/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class UserRepoVC: UIViewController {
    
    @IBOutlet weak var repoOwnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reteritveString: String? = KeychainWrapper.standard.string(forKey: "access_token")
        
        repoOwnerLabel.text = reteritveString ?? ""
    }
}
