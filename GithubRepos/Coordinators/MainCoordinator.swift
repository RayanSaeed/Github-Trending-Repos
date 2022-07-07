//
//  MainCoordinator.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 23/06/2022.
//

import UIKit

protocol Coordinator: AnyObject {
	var childCoordinators: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }

	func start()
}

final class MainCoordinator: Coordinator {

	var childCoordinators = [Coordinator]()
	var navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		let vc = TrendingReposViewController()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}

	func userDidTapRepository(viewModel: RepositoryCellViewModelable) {
		let vc = RepositoryDetailViewController(desciprtion: viewModel.description)
		navigationController.pushViewController(vc, animated: true)
	}
}
