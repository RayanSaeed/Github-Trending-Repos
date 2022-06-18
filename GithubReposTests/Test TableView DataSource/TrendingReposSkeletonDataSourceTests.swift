//
//  TrendingReposSkeletonDataSourceTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 18/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class TrendingReposSkeletonDataSourceTests: XCTestCase {

	private var sut = TrendingReposSkeletonDataSource()
	private let tableView = UITableView()
	private let reuseIdentifier = RepositoryCell.reuseIdentifier

	override func setUp() {
		tableView.register(
			UINib(nibName: "RepositoryCell", bundle: nil),
			forCellReuseIdentifier: reuseIdentifier
		)
		tableView.dataSource = sut
	}

	func testTrendingReposSkeletonDataSource_numberOfRows_inSectionZero() {
		let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)

		expect(numberOfRows).to(equal(10))
	}

	func testTrendingReposSkeletonDataSource_cellIdentifier() {
		let cell = sut.tableView(tableView, cellForRowAt: .init(row: 0, section: 0))

		expect(cell.reuseIdentifier).to(equal(reuseIdentifier))
	}

	func testTrendingReposSkeletonDataSource_returnsCorrect_cellIdentifier() {
		let reuseIdentifier = sut.collectionSkeletonView(tableView, cellIdentifierForRowAt: .init(row: 0, section: 0))

		expect(reuseIdentifier).to(equal(RepositoryCell.reuseIdentifier))
	}
}
