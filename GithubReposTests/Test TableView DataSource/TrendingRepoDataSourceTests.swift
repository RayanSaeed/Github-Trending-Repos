//
//  TrendingRepoDataSourceTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 17/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class TrendingRepoDataSourceTests: XCTestCase {

	private var sut: TrendingReposListDataSource<RepositoryCellViewModelable>!
	private let tableView = UITableView()
	private let reuseIdentifier = "repositoryCell"

	override func setUp() {
		sut = .make(for: [RepositoryCellViewModel.stub])
		tableView.register(
			UINib(nibName: "RepositoryCell", bundle: nil),
			forCellReuseIdentifier: reuseIdentifier
		)
	}

	func testTrendingRepoDataSource_numberOfRows_inSectionZero() {
		tableView.dataSource = sut
		let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)

		expect(numberOfRows).to(equal(1))
	}

	func testTrendingRepoDataSource_cellIdentifier() {
		tableView.dataSource = sut
		let cell = sut.tableView(tableView, cellForRowAt: .init(row: 0, section: 0))

		expect(cell.reuseIdentifier).to(equal(reuseIdentifier))
	}

	func testTrendingRepoDataSource_cellConfigurator_dataBinding() throws {
		let repoStub = RepositoryCellViewModel.stub
		tableView.dataSource = sut
		let cell = try XCTUnwrap(sut.tableView(tableView, cellForRowAt: .init(row: 0, section: 0)) as? RepositoryCell)

		expect(cell.reuseIdentifier).to(equal(reuseIdentifier))
		expect(cell.repositoryNameLabel.text).to(equal(repoStub.name))
		expect(cell.ownerNameLabel.text).to(equal(repoStub.ownerLogin))
		expect(cell.descriptionLabel.text).to(equal(repoStub.description))
		expect(cell.languageLabel.text).to(equal(repoStub.language))
		expect(cell.starsCountLabel.text).to(equal(repoStub.starsCount))
	}
}
