//
//  GithubServiceTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 16/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class GithubServiceTests: XCTestCase {

	func testGithubService_defaultInit() {
		let sut = GithubService()

		let config = sut.session.configuration

		expect(config.requestCachePolicy).to(equal(.useProtocolCachePolicy))
	}

	func testGithubService_returns_successResponse() async throws {
		let sut = GithubServiceSuccessfulMock()

		let result = await sut.getTrendingRepos()

		switch result {
			case .success(let response):
				expect(response).to(equal(.mock))
			case .failure(let error):
				fail("Expected to be a success but got a failure with \(error)")
		}

	}

	func testGithubService_returns_failureResponse() async throws {
		let sut = GithubServiceFailureMock()

		let result = await sut.getTrendingRepos()

		switch result {
			case .success(let response):
				fail("Expected to be a failure but got a success with \(response)")
			case .failure(let error):
				expect(error).to(equal(.noData))
		}
	}
}
