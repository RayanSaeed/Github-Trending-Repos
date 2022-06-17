//
//  TrendingReposViewModelTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 17/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class TrendingReposViewModelTests: XCTestCase {

    func testTrendingReposViewModel_fetchTrendingRepos_success() async {
		let mockService = GithubServiceSuccessfulMock()
		let sut = TrendingReposViewModel(service: mockService)

		let result = await sut.fetchTrendingRepos()

		expect(result).to(equal(.mock))
	}

	func testTrendingReposViewModel_fetchTrendingRepos_failure() async {
		let mockService = GithubServiceFailureMock()
		let sut = TrendingReposViewModel(service: mockService)

		let result = await sut.fetchTrendingRepos()

		expect(result).to(beNil())
	}

	func testTrendingReposViewModel_title() {
		let sut = TrendingReposViewModelSuccessfulMock()

		let title = sut.navigationBarTitle

		expect(title).to(equal(.mockTitle))
	}
}
