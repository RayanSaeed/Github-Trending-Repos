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

		let viewModels = await sut.getTrendingReposListViewModels()
		let vm = viewModels?.first
		let stub = RepositoryCellViewModel.stub

		expect(viewModels?.count).to(equal(1))
		expect(vm?.name).to(equal(stub.name))
		expect(vm?.ownerLogin).to(equal(stub.ownerLogin))
		expect(vm?.description).to(equal(stub.description))
		expect(vm?.language).to(equal(stub.language))
		expect(vm?.starsCount).to(equal(stub.starsCount))
		expect(vm?.avatarUrl).to(equal(stub.avatarUrl))
	}

	func testTrendingReposViewModel_fetchTrendingRepos_failure() async {
		let mockService = GithubServiceFailureMock()
		let sut = TrendingReposViewModel(service: mockService)

		let result = await sut.getTrendingReposListViewModels()

		expect(result).to(beNil())
	}

	func testTrendingReposViewModel_title() {
		let sut = TrendingReposViewModelSuccessfulMock()

		let title = sut.navigationBarTitle

		expect(title).to(equal(.mockTitle))
	}
}
