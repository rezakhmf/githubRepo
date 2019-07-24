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
}

public class GithubViewModel: GithubViewModelProvider {
    
    // MARK: - Dependencies
    private let reposeService: RepoServiceProvider = ReposeService.shared
    
    
    func fetchRepo(completion: @escaping (Repos) -> Void) {
        
        reposeService.fetchRepos { repos in
            switch repos {
            case .failure(let error): 
                print(error.description)
            case .success(let reposResponse):
                completion(reposResponse)
            }
        }
    }
    
    
}




