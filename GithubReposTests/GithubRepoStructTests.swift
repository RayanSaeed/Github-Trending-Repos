//
//  GithubRepoStructTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 15/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class GithubRepoStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit_GithubRepo_withID() throws {
		let repo = GithubRepo(id: 123)

		expect(repo).toNot(beNil())
		expect(repo.id).to(equal(123))
	}

}
