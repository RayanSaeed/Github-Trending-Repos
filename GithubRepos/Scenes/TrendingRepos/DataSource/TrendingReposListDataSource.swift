//
//  TrendingReposListDataSource.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 17/06/2022.
//

import Foundation
import UIKit
import Kingfisher

class TrendingReposListDataSource<ViewModel>: NSObject, UITableViewDataSource {

	typealias CellConfigurator = (ViewModel, UITableViewCell) -> Void

	var viewModels: [ViewModel]

	private let reuseIdentifier: String
	private let cellConfigurator: CellConfigurator

	init(models: [ViewModel],
		 reuseIdentifier: String,
		 cellConfigurator: @escaping CellConfigurator) {
		self.viewModels = models
		self.reuseIdentifier = reuseIdentifier
		self.cellConfigurator = cellConfigurator
	}

	// MARK: - UITableViewDataSource

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModels.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = viewModels[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

		cellConfigurator(model, cell)

		return cell
	}
}

extension TrendingReposListDataSource where ViewModel == RepositoryCellViewModelable {
	/// Convenience method for making a `TrendingReposListDataSource` object
	/// - Parameters:
	///   - viewModels: The viewModels to use for each cell
	///   - reuseIdentifier: The reuseIdentifier for table view cells
	///
	/// - Returns:
	/// A `TrendingReposListDataSource` object that has been configured with
	/// the passed in viewModels and reuseIdentifer.
	static func make(for viewModels: [RepositoryCellViewModelable],
					 reuseIdentifier: String = RepositoryCell.reuseIdentifier) -> TrendingReposListDataSource {

		TrendingReposListDataSource(models: viewModels, reuseIdentifier: reuseIdentifier)
		{ (viewModel, cell) in
			guard let cell = cell as? RepositoryCell else {
				fatalError("Could not unwrap a RepositoryCell for RepositoryCellViewModel")
			}
			cell.ownerNameLabel.text = viewModel.ownerLogin
			cell.repositoryNameLabel.text = viewModel.name
			cell.descriptionLabel.text = viewModel.description
			cell.languageLabel.text = viewModel.language
			cell.starsCountLabel.text = viewModel.starsCount

			cell.avatarImageView.kf.setImage(with: viewModel.avatarUrl)

			cell.descriptionLabel.isHidden = !viewModel.isExpanded
			cell.detailsStackView.isHidden = !viewModel.isExpanded
		}
	}
}
