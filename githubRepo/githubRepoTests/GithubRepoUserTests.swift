//
//  GithubRepoUserTests.swift
//  githubRepoTests
//
//  Created by Qantas Dev on 24/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import XCTest
@testable import githubRepo

class GithubRepoUserTests: XCTestCase {
    
    var repoUserData: Data?
    
    override func setUp() {
        
        repoUserData = try? TestUtils.jsonData(forResource: "repo-user-data")
    }
    
    override func tearDown() {
        
    }
    
    func testNoNullRepoUserModelData() {
        
        // Given repositories
        guard let repoUser = try? JSONDecoder().decode(UserRepoModel.self, from: repoUserData!) else {
            XCTFail()
            return
        }
        // Then should have populated repository user info
        XCTAssertNotNil(repoUser)
    }
    
    func testValiFirstdRepoUserModelData() {
        
        // Given repositories
        guard let repoUser = try? JSONDecoder().decode(UserRepoModel.self, from: repoUserData!) else {
            XCTFail()
            return
        }
        // Then should have populated repository user info
        XCTAssertNotNil(repoUser)
        XCTAssertEqual(repoUser.type, "User")
        XCTAssertEqual(repoUser.name, "Reza Farahani")
        XCTAssertEqual(repoUser.company, "Farahani Consulting")
        XCTAssertEqual(repoUser.blog, "http://www.farahaniconsulting.com/")
        XCTAssertEqual(repoUser.avatarURL, "https://avatars2.githubusercontent.com/u/3985692?v=4")
    }
    
    
}

