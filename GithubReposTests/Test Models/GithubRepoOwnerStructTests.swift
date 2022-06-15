//
//  GithubRepoOwnerStructTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 15/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class GithubRepoOwnerStructTests: XCTestCase {

	func testInit_GithubRepo_withProperties() throws {
		// Given
		let id = 123
		let login = "OwnerLogin"
		let avatarUrl = "OwnerAvatarUrl"

		// When
		let owner = GithubRepoOwner(
			id: id,
			login: login,
			avatarUrl: avatarUrl
		)

		// Then
		expect(owner).toNot(beNil())
		expect(owner.id).to(equal(id))
		expect(owner.login).to(equal(login))
		expect(owner.avatarUrl).to(equal(avatarUrl))
	}
}

