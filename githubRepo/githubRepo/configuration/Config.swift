//
//  Services.swift
//  githubRepo
//
//  Created by Reza Farahani on 23/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import Foundation

protocol ConfigurationProvider: class {
    var githubConfig: GithubConfig { get }
}

struct GithubConfig: Codable {
    let baseURL: String
    let consumerKey: String
    let consumerSecret: String
    let authorizeUrl: String
    let accessTokenUrl: String
    let callBackURL: String
    let repoUrl: String
    let repoUserUrl: String
    
    enum CodingKeys: String, CodingKey {
        case baseURL = "baseUrl"
        case consumerKey = "consumerKey"
        case consumerSecret = "consumerSecret"
        case authorizeUrl = "authorizeUrl"
        case accessTokenUrl = "accessTokenUrl"
        case callBackURL = "callBackURL"
        case repoUrl = "repoUrl"
        case repoUserUrl = "repoUserUrl"
    }
}

private struct Config: Codable {
    let githubConfig: GithubConfig
    
    enum CodingKeys: String, CodingKey {
        case githubConfig = "Github"
    }
}

/// App Configuration obtained from bundled Config.plist
class Configuration: ConfigurationProvider {
    
    static var shared: Configuration = {
        guard let url = Bundle.main.url(forResource: "Config", withExtension: "plist") else {
            fatalError("Config.plist not found in target")
        }
        guard let config = Configuration(plistURL: url) else {
            fatalError("Unable to read Config.plist")
        }
        return config
    }()
    
    let githubConfig: GithubConfig
    
    init?(plistURL url: URL) {
        guard let data = try? Data(contentsOf: url),
            let config = try? PropertyListDecoder().decode(Config.self, from: data) else {
                print("Unable to read \(url.absoluteString)")
                return nil
        }
        self.githubConfig = config.githubConfig
        
    }
}
