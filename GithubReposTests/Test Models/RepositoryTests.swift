//
//  RepositoryTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 15/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class RepositoryTests: XCTestCase {

    func testInit_GithubRepo_withProperties() {
		// Given
		let id = 123
		let name = "RepoName"
		let repoOwner = Owner(id: 456, login: "OwnerLogin", avatarUrl: "OwnerAvatarUrl")
		let description = "RepoDescription"
		let language = "RepoLanguage"
		let starsCount = 786

		// When
		let sut = Repository(
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
