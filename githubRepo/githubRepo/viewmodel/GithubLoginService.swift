//
//  GithubLoginService.swift
//  githubRepo
//
//  Created by Qantas Dev on 23/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import Foundation
import OAuthSwift

protocol GithubViewModelProvider {
    func fetchRepo(completion: @escaping (Repos) -> Void)
    func fetchUserRepoInfo(completion: @escaping (UserRepoModel) -> Void)
}

public class GithubViewModel: GithubViewModelProvider {
    
    // MARK: - Dependencies
    private let reposeService: RepoServiceProvider = ReposeService.shared
    
    // MARK: - fetch user's repos
    func fetchRepo(completion: @escaping (Repos) -> Void) {
        
        reposeService.fetchRepos { response in
            switch response {
            case .failure(let error): 
                print(error.description)
            case .success(let reposResponse):
                completion(reposResponse)
            }
        }
    }
    
    // MARK: - fetch user info
    func fetchUserRepoInfo(completion: @escaping (UserRepoModel) -> Void) {
        reposeService.fetchUserRepo { response in
            switch response {
            case .failure(let error):
                print(error.description)
            case .success(let userInfo):
                completion(userInfo)
            }
        }
    }
    
    
}




