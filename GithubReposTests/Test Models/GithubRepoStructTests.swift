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

    func testInit_GithubRepo_withProperties() throws {
		// Given
		let id = 123
		let name = "RepoName"
		let repoOwner = GithubRepoOwner(id: 456, login: "OwnerLogin", avatarUrl: "OwnerAvatarUrl")
		let description = "RepoDescription"
		let language = "RepoLanguage"
		let starsCount = 786

		// When
		let repo = GithubRepo(
			id: id,
			name: name,
			owner: repoOwner,
			description: description,
			language: language,
			starsCount: starsCount
		)

		// Then
		expect(repo).toNot(beNil())
		expect(repo.id).to(equal(id))
		expect(repo.name).to(equal(name))
		expect(repo.owner).to(equal(repoOwner))
		expect(repo.description).to(equal(description))
		expect(repo.language).to(equal(language))
		expect(repo.starsCount).to(equal(starsCount))
	}
}
