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

	// MARK: - ViewController Tests

	func testViewController_getsTitle_fromViewModel() {
		let mockVM = TrendingReposViewModelSuccessfulMock()
		let sut = TrendingReposViewController(viewModel: mockVM)

		_ = sut.view

		let title = sut.title

		expect(title).to(equal(mockVM.navigationBarTitle))
	}

	func testViewController_fetchData_fromViewModel_succeeds() async {
		let mockVM = TrendingReposViewModelSuccessfulMock()
		let sut = await TrendingReposViewController(viewModel: mockVM)

		_ = await sut.view

		let indexPath = IndexPath(row: 0, section: 0)
		let cell = await sut.tableView.cellForRow(at: indexPath) as? RepositoryCell

		let numberOfRows = await sut.tableView.numberOfRows(inSection: 0)
		let stub = RepositoryCellViewModel.stub

		let repoName = await cell?.repositoryNameLabel.text
		let ownerName = await cell?.ownerNameLabel.text
		let description = await cell?.descriptionLabel.text
		let language = await cell?.languageLabel.text
		let starsCount = await cell?.starsCountLabel.text

		expect(numberOfRows).to(equal(1))
		expect(mockVM.fetchTrendingReposWasCalled).to(beTrue())
		expect(repoName).to(equal(stub.name))
		expect(ownerName).to(equal(stub.ownerLogin))
		expect(description).to(equal(stub.description))
		expect(language).to(equal(stub.language))
		expect(starsCount).to(equal(stub.starsCount))
	}

	func testViewController_fetchData_fromViewModel_fails() async {
		let mockVM = TrendingReposViewModelFailureMock()
		let sut = await TrendingReposViewController(viewModel: mockVM)

		_ = await sut.view

		let numberOfRows = await sut.tableView.numberOfRows(inSection: 0)

		expect(numberOfRows).to(equal(0))
		expect(mockVM.fetchTrendingReposWasCalled).to(beTrue())
	}
}
