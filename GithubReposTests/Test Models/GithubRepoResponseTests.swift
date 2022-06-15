//
//  GithubRepoResponseTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 15/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class GithubRepoResponseTests: XCTestCase, Mockable {

	func testGithubRepoResponse_loadsFromJSON() throws {
		let sut = loadJSON(filename: "github_repo_response", type: GithubRepoResponse.self)

		expect(sut).toNot(beNil())
		expect(sut.repos.count).to(equal(1))
	}

	func testGithubRepoResponse_loadsFromJSON_withCorrectValues() throws {
		let sut = loadJSON(filename: "github_repo_response", type: GithubRepoResponse.self)

		let repo = try XCTUnwrap(sut.repos.first)
		let owner = GithubRepoOwner(id: 456, login: "golang", avatarUrl: "https://avatars.someUrl")


		expect(sut).toNot(beNil())
		expect(sut.repos.count).to(equal(1))
		expect(repo.id).to(equal(123))
		expect(repo.name).to(equal("go"))
		expect(repo.owner).to(equal(owner))
		expect(repo.description).to(equal("The Go programming language"))
		expect(repo.language).to(equal("Go"))
		expect(repo.starsCount).to(equal(777))
	}
}

