//
//  UserRepoVC.swift
//  githubRepo
//
//  Created by Reza Farahani on 23/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class UserRepoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var repoOwnerLabel: UILabel!
    
    @IBOutlet weak var repoTableView: UITableView!
    
    // MARK: - Parameteres
    var githubViewModel: GithubViewModel?
    
    public var userRepo: String = "" {
        didSet {
           repoOwnerLabel.text = self.userRepo
        }
    }
    public var repos: Repos = [] {
        didSet {
           repoTableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.repoTableView.dataSource = self
        self.repoTableView.delegate = self
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("RepoCell", owner: self, options: nil)?.first as! RepoCell
        
        cell.textLabel?.text = repos[indexPath.row].name
        
        return cell
    }
}
