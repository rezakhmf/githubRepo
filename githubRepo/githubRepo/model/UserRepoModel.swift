//
//  UserRepoModel.swift
//  githubRepo
//
//  Created by Reza Farahani on 24/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import Foundation


// MARK: - UserRepoModel
public struct UserRepoModel: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?
    let name, company: String?
    let blog: String?
    let location, email, hireable, bio: JSONNull?
    let publicRepos, publicGists, followers, following: Int?
    let createdAt, updatedAt: String?
    let privateGists, totalPrivateRepos, ownedPrivateRepos, diskUsage: Int?
    let collaborators: Int?
    let twoFactorAuthentication: Bool?
    let plan: Plan?
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case name, company, blog, location, email, hireable, bio
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case privateGists = "private_gists"
        case totalPrivateRepos = "total_private_repos"
        case ownedPrivateRepos = "owned_private_repos"
        case diskUsage = "disk_usage"
        case collaborators
        case twoFactorAuthentication = "two_factor_authentication"
        case plan
    }
}

// MARK: - Plan
public struct Plan: Codable {
    let name: String?
    let space, collaborators, privateRepos: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, space, collaborators
        case privateRepos = "private_repos"
    }
}

