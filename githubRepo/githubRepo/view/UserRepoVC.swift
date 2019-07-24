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
    
    public var userRepo: String = "" {
        didSet {
           repoOwnerLabel.text = self.userRepo
        }
    }
    public var repos: Repos = [] {
        didSet {
           
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.githubViewModel = GithubViewModel()
        
        self.githubViewModel?.fetchRepo { repos in
            //print(repos)
            self.repos = repos
        }
        
        
        self.githubViewModel?.fetchUserRepoInfo { userInfo in
            print(userInfo)
            guard let userName = userInfo.name else {
             return
            }
            self.userRepo = userName
        }
        
    }
}
