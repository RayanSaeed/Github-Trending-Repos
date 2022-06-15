//
//  GithubRepoOwnerTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 15/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class GithubRepoOwnerTests: XCTestCase {

	func testInit_GithubRepoOwner_withProperties() throws {
		// Given
		let id = 123
		let login = "OwnerLogin"
		let avatarUrl = "OwnerAvatarUrl"

		// When
		let sut = GithubRepoOwner(
			id: id,
			login: login,
			avatarUrl: avatarUrl
		)

		// Then
		expect(sut).toNot(beNil())
		expect(sut.id).to(equal(id))
		expect(sut.login).to(equal(login))
		expect(sut.avatarUrl).to(equal(avatarUrl))
	}
}

