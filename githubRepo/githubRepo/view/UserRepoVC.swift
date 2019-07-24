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
    
    // MARK: - Parameteres
    var githubViewModel: GithubViewModel?
    
    public var repos: Repos = [] {
        didSet {
           
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let reteritveString: String? = KeychainWrapper.standard.string(forKey: "access_token")
        
        repoOwnerLabel.text = reteritveString ?? ""
        
        self.githubViewModel = GithubViewModel()
        
        self.githubViewModel?.fetchRepo { repos in
            print(repos)
            self.repos = repos
        }
        
        
    }
}
