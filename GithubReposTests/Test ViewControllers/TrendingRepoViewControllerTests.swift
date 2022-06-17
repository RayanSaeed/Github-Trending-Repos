//
//  TrendingRepoViewControllerTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 17/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class TrendingRepoViewControllerTests: XCTestCase {

	func testViewController_fetchesData_fromViewModel() {
		let mockService = GithubServiceSuccessfulMock()
		let mockVM = TrendingReposViewModelSuccessfulMock(service: mockService)
		let sut = TrendingReposViewController(viewModel: mockVM)

		_ = sut.view

		expect(mockVM.fetchTrendingReposWasCalled).to(beTrue())
	}
}
