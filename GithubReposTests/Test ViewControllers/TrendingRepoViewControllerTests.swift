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

		DispatchQueue.main.async {
			expect(mockVM.fetchTrendingReposWasCalled).to(beTrue())
		}
	}

	func testViewController_fetchData_fromViewModel_succeeds() async {
		let mockService = GithubServiceSuccessfulMock()
		let mockVM = TrendingReposViewModelSuccessfulMock(service: mockService)
		let sut = await TrendingReposViewController(viewModel: mockVM)
		let stub = RepositoryCellViewModel.stub

		_ = await sut.view

		let cell = await sut.tableView.cellForRow(at: .init(row: 0, section: 0)) as? RepositoryCell
		let numberOfRows = await sut.tableView.numberOfRows(inSection: 0)

		expect(numberOfRows).to(equal(1))

		DispatchQueue.main.async {
			expect(cell?.repositoryNameLabel.text).to(equal(stub.name))
			expect(cell?.ownerNameLabel.text).to(equal(stub.ownerLogin))
			expect(cell?.descriptionLabel.text).to(equal(stub.description))
			expect(cell?.languageLabel.text).to(equal(stub.language))
			expect(cell?.starsCountLabel.text).to(equal(stub.starsCount))
		}
	}

	func testViewController_fetchData_fromViewModel_fails() async {
		let mockService = GithubServiceFailureMock()
		let mockVM = TrendingReposViewModelFailureMock(service: mockService)
		let sut = await TrendingReposViewController(viewModel: mockVM)

		_ = await sut.view

		let numberOfRows = await sut.tableView.numberOfRows(inSection: 0)

		DispatchQueue.main.async {
			expect(numberOfRows).to(equal(0))
			expect(mockVM.fetchTrendingReposWasCalled).to(beTrue())
		}
	}
}
