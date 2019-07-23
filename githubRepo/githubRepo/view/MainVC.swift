//
//  ViewController.swift
//  githubRepo
//
//  Created by Qantas Dev on 23/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import UIKit
import SafariServices
import OAuthSwift

class MainVC: OAuthViewController {
    
    // Dependencies
    let config = Configuration.shared
        
    // properties
    private var oauthswift: OAuth2Swift?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func loginDidTap(_ sender: Any) {
        redirectToGithub()
    }
    
    private func redirectToGithub() {
        
         self.oauthswift = OAuth2Swift(consumerKey: config.githubConfig.consumerKey, consumerSecret: config.githubConfig.consumerSecret, authorizeUrl: config.githubConfig.authorizeUrl, accessTokenUrl: config.githubConfig.accessTokenUrl, responseType: "code")
        
        oauthswift?.allowMissingStateCheck = true
        
        oauthswift?.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift!)
        
        guard let url = URL(string: "eduRepo://oauth2Callback") else { return }
        
        oauthswift?.authorize(withCallbackURL: url, scope: "user,repo", state: "") { result in
            switch result {
            case .success(let (_, _, params)):
                print(params)
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}
