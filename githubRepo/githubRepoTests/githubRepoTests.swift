//
//  githubRepoTests.swift
//  githubRepoTests
//
//  Created by Reza Farahani on 23/7/19.
//  Copyright © 2019 Farahani Consulting. All rights reserved.
//

import XCTest
@testable import githubRepo

class GithubRepoTests: XCTestCase {
    
    var reposData: Data?

    override func setUp() {
        
        reposData = try? TestUtils.jsonData(forResource: "repos-data")
    }

    override func tearDown() {
        
    }
    
    func testNoNullRepoModelData() {
        
        // Given repositories
        guard let repos = try? JSONDecoder().decode(Repos.self, from: reposData!) else {
            XCTFail()
            return
        }
        // Then should have populated list of repositories
        XCTAssertNotNil(repos)
    }
    
    func testValiFirstdRepoModelData() {
        
        // Given repositories
        guard let repos = try? JSONDecoder().decode(Repos.self, from: reposData!) else {
            XCTFail()
            return
        }
        // Then should have populated list of repositories
        XCTAssertNotNil(repos.first)
        XCTAssertEqual(repos.first?.name, "swift-algorithm-handon")
        XCTAssertEqual(repos.first?.fullName, "rezakhmf/swift-algorithm-handon")
        XCTAssertEqual(repos.first?.createdAt, "2017-05-12T12:53:03Z")
        XCTAssertEqual(repos.first?.language, "Swift")
        XCTAssertEqual(repos.first?.gitURL, "git://github.com/rezakhmf/swift-algorithm-handon.git")
        XCTAssertEqual(repos.first?.permissions?.admin, true)
        XCTAssertEqual(repos.first?.permissions?.pull, true)
        XCTAssertEqual(repos.first?.permissions?.push, true)
    }
    
    func testValidLastRepoModelData() {
        
        // Given repositories
        guard let repos = try? JSONDecoder().decode(Repos.self, from: reposData!) else {
            XCTFail()
            return
        }
        // Then should have populated list of repositories
        XCTAssertNotNil(repos.last)
        XCTAssertEqual(repos.last?.name, "traffic-light")
        XCTAssertEqual(repos.last?.fullName, "rezakhmf/traffic-light")
        XCTAssertEqual(repos.last?.createdAt, "2017-12-13T08:02:02Z")
        XCTAssertEqual(repos.last?.language, "Swift")
        XCTAssertEqual(repos.last?.gitURL, "git://github.com/rezakhmf/traffic-light.git")
        XCTAssertEqual(repos.last?.permissions?.admin, true)
        XCTAssertEqual(repos.last?.permissions?.pull, true)
        XCTAssertEqual(repos.last?.permissions?.push, true)
    }
    
}
