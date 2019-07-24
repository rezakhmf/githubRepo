//
//  RepoServiceProvider.swift
//  githubRepo
//
//  Created by Reza Farahani on 24/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

public protocol RepoServiceProvider: class {
    func fetchRepos(completion: @escaping (Result<Repos, NSError>) -> Void)
    func fetchUserRepo(completion: @escaping (Result<UserRepoModel, NSError>) -> Void)
}

final class ReposeService: RepoServiceProvider {
    
    // MARK: - Singleton
    static let shared = ReposeService()
    
    // MARK: - Dependencies
    private let networkService: NetworkService
    private let configuration: Configuration
    
    public init(networkService: NetworkService = NetworkService(), configuration: Configuration = Configuration.shared) {
        self.networkService = networkService
        self.configuration = configuration
    }
    
    //MARK: - fetch repos
    func fetchRepos(completion: @escaping (Result<Repos, NSError>) -> Void) {
        guard  !configuration.githubConfig.repoUrl.isEmpty else {
            completion(.failure(NetworkError.apiGatewayConfigurationMissingUrl))
            return
        }
        
        let repoURL = configuration.githubConfig.repoUrl
        
        let url = URL(string: repoURL)!
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPRequestType.get.httpMethod
        
        let token = KeychainWrapper.standard.string(forKey: "access_token")
        
        networkService.genericDataTask(withRequest: request, authorization: .token(accessToken: token ?? "")) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(_, let data):
                    guard let repos = try? JSONDecoder().decode(Repos.self, from: data) else {
                        completion(.failure(NetworkError.jsonConversion))
                        return
                    }
                    
                    completion(.success(repos))
                }
            }
        }
    }
    
    //MARK: - fetch user info
    
    func fetchUserRepo(completion: @escaping (Result<UserRepoModel, NSError>) -> Void) {
        guard  !configuration.githubConfig.repoUrl.isEmpty else {
            completion(.failure(NetworkError.apiGatewayConfigurationMissingUrl))
            return
        }
        
        let userRepoURL = configuration.githubConfig.repoUserUrl
        
        let url = URL(string: userRepoURL)!
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPRequestType.get.httpMethod
        
        let token = KeychainWrapper.standard.string(forKey: "access_token")
        
        networkService.genericDataTask(withRequest: request, authorization: .token(accessToken: token ?? "")) { result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(_, let data):
                    guard let repos = try? JSONDecoder().decode(UserRepoModel.self, from: data) else {
                        completion(.failure(NetworkError.jsonConversion))
                        return
                    }
                    
                    completion(.success(repos))
                }
            }
        }
    }
}



