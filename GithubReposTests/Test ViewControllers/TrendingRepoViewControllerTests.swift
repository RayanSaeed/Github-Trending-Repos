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

	func testViewController_getsTitle_fromViewModel() {
		let mockService = GithubServiceSuccessfulMock()
		let mockVM = TrendingReposViewModelSuccessfulMock(service: mockService)
		let sut = TrendingReposViewController(viewModel: mockVM)

		_ = sut.view

		expect(sut.title).to(equal(mockVM.navigationBarTitle))
	}

	func testViewController_fetchesData_fromViewModel() async {
		let mockService = GithubServiceSuccessfulMock()
		let mockVM = TrendingReposViewModelSuccessfulMock(service: mockService)
		let sut = await TrendingReposViewController(viewModel: mockVM)

		_ = await sut.view

		expect(mockVM.fetchTrendingReposWasCalled).to(beTrue())
	}

	func testViewController_fetchData_fromViewModel_succeeds() async {
		let mockService = GithubServiceSuccessfulMock()
		let mockVM = TrendingReposViewModelSuccessfulMock(service: mockService)
		let sut = await TrendingReposViewController(viewModel: mockVM)

		_ = await sut.view

		let viewModels = await sut.dataSource?.viewModels
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

	func testViewController_fetchData_fromViewModel_fails() async {
		let mockService = GithubServiceFailureMock()
		let mockVM = TrendingReposViewModelFailureMock(service: mockService)
		let sut = await TrendingReposViewController(viewModel: mockVM)

		_ = await sut.view

		let viewModels = await sut.dataSource?.viewModels

		expect(viewModels).to(beNil())
	}
}
