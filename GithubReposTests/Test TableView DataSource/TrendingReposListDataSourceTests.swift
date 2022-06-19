//
//  TrendingReposListDataSourceTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 17/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

final class TrendingReposListDataSourceTests: XCTestCase {

	private var sut: TrendingReposListDataSource<RepositoryCellViewModelable>!
	private let tableView = UITableView()
	private let reuseIdentifier = RepositoryCell.reuseIdentifier

	override func setUp() {
		sut = .make(for: [RepositoryCellViewModel.stub])
		tableView.register(
			UINib(nibName: "RepositoryCell", bundle: nil),
			forCellReuseIdentifier: reuseIdentifier
		)
		tableView.dataSource = sut
	}

	func testTrendingReposListDataSource_numberOfRows_inSectionZero() {
		let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)

		expect(numberOfRows).to(equal(1))
	}

	func testTrendingReposListDataSource_cellIdentifier() {
		let cell = sut.tableView(tableView, cellForRowAt: .init(row: 0, section: 0))

		expect(cell.reuseIdentifier).to(equal(reuseIdentifier))
	}

	func testTrendingReposListDataSource_cellConfigurator_dataBinding() throws {
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
