//
//  GithubLoginService.swift
//  githubRepo
//
//  Created by Qantas Dev on 23/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import Foundation
import OAuthSwift

protocol GithubLoginProvder {
    func redirect(github url: String)
}

//public class GithubLoginService: GithubLoginProvder {
//    
//    // Dependencies
//    
//    let config = Configuration.shared
//    
//    func redirect(github url: String) {
//        
//        let oauthswift = OAuth2Swift(consumerKey: config.githubConfig.consumerKey, consumerSecret: config.githubConfig.consumerSecret, authorizeUrl: "https://github.com/login/oauth/authorize", accessTokenUrl: "https://github.com/login/oauth/access_token", responseType: "code")
//        
//        oauthswift.allowMissingStateCheck = true
//        
//        oauthswift.authorizeURLHandler = SafariURLHandler(viewController: self, oauthSwift: oauthswift)
//        
//    }
//    
//
//    
//}
