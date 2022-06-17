//
//  RepositoryCellViewModelTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 17/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class RepositoryCellViewModelTests: XCTestCase {

	func testRepositoryCellViewModel_isExpanded() async {
		let sut = RepositoryCellExpandedViewModelStub()

		expect(sut.isExpanded).to(beTrue())
	}

	func testRepositoryCellViewModel_isNotExpanded() async {
		let sut = RepositoryCellCollapsedViewModelStub()

		expect(sut.isExpanded).to(beFalse())
	}
}
