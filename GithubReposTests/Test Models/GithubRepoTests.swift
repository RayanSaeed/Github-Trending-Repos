//
//  GithubRepoTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 15/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class GithubRepoTests: XCTestCase {

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
		let sut = GithubRepo(
			id: id,
			name: name,
			owner: repoOwner,
			description: description,
			language: language,
			starsCount: starsCount
		)

		// Then
		expect(sut).toNot(beNil())
		expect(sut.id).to(equal(id))
		expect(sut.name).to(equal(name))
		expect(sut.owner).to(equal(repoOwner))
		expect(sut.description).to(equal(description))
		expect(sut.language).to(equal(language))
		expect(sut.starsCount).to(equal(starsCount))
	}
}
