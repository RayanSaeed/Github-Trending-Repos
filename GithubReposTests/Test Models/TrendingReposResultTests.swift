//
//  TrendingReposResultTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 15/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class TrendingReposResultTests: XCTestCase, Mockable {

	var sut: TrendingReposResult!

	override func setUp() {
		super.setUp()
		sut = loadJSON(filename: "github_repo_response", type: TrendingReposResult.self)
	}

	func testGithubRepoResponse_loadsFromJSON() {
		expect(self.sut).toNot(beNil())
		expect(self.sut.repos.count).to(equal(1))
	}

	func testGithubRepoResponse_loadsFromJSON_withCorrectValues() throws {
		let repo = try XCTUnwrap(sut.repos.first)
		let owner = Owner(id: 456, login: "golang", avatarUrl: "https://avatars.someUrl")

		expect(self.sut).toNot(beNil())
		expect(self.sut.repos.count).to(equal(1))
		expect(repo.id).to(equal(123))
		expect(repo.name).to(equal("go"))
		expect(repo.owner).to(equal(owner))
		expect(repo.description).to(equal("The Go programming language"))
		expect(repo.language).to(equal("Go"))
		expect(repo.starsCount).to(equal(777))
	}
}

