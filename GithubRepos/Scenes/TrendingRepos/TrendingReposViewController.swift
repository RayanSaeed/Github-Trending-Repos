//
//  TrendingReposViewController.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 17/06/2022.
//

import UIKit
import Combine

final class TrendingReposViewController: UIViewController {

	// MARK: - Instance Properties
	let viewModel: TrendingReposViewModelable
	var dataSource: TrendingReposListDataSource<RepositoryCellViewModelable>? {
		didSet {
			if dataSource == nil {
				// show the lottie retry animation view
			} else {
				tableView.dataSource = dataSource
				tableView.reloadData()
			}
		}
	}

	// MARK: - Private Properties

	// MARK: - Initializers
	init(viewModel: TrendingReposViewModelable = TrendingReposViewModel()) {
		self.viewModel = viewModel
		self.dataSource = nil
		super.init(nibName: "TrendingReposViewController", bundle: .main)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - IBOutlets
	@IBOutlet weak var tableView: UITableView!

	// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		self.title = viewModel.navigationBarTitle

		setupTableView()
		fetchTrendingRepos()
    }

	// MARK: - Helper Methods
	private func setupTableView() {
		tableView.registerCell(type: RepositoryCell.self, identifier: RepositoryCell.reuseIdentifier)
	}

	private func fetchTrendingRepos() {
		Task {
			if let viewModels = await viewModel.getTrendingReposListViewModels() {
				// We also need to keep a strong reference to the data source,
				// since UITableView only uses a weak reference for it.
				dataSource = .make(for: viewModels)
			} else {
				// Data could not be fetched from cache and service
				dataSource = nil
			}
		}
	}
}
