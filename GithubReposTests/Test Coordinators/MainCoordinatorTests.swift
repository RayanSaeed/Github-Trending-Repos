//
//  MainCoordinatorTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 23/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

final class MainCoordinatorTests: XCTestCase {

	func testMainCoordinator_rootViewController_isTrendingReposVC() {
		// Given
		let navVC = UINavigationController()
		let sut = MainCoordinator(navigationController: navVC)

		// When
		sut.start()

		// Then
		let rootVC = sut.navigationController.viewControllers.first
		expect(rootVC is TrendingReposViewController).to(beTrue())
	}

	func testMainCoordinator_navigatesTo_RepositoryDetailVC() {
		// Given
		let navVC = UINavigationController()
		let sut = MainCoordinator(navigationController: navVC)

		// When
		sut.start()
		sut.userDidTapRepository(viewModel: RepositoryCellViewModel.stub)

		let predicate = NSPredicate { navVC, _ in
			(navVC as? UINavigationController)?.topViewController is RepositoryDetailViewController
		}

		let _ = expectation(for: predicate, evaluatedWith: sut.navigationController)

		waitForExpectations(timeout: 2)

		// Then
		let topVC = sut.navigationController.topViewController
		expect(topVC is RepositoryDetailViewController).to(beTrue())
	}
}
