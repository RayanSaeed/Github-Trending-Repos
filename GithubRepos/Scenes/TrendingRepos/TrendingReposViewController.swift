//
//  TrendingReposViewController.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 17/06/2022.
//

import UIKit
import SkeletonView

final class TrendingReposViewController: UIViewController {

	// MARK: - Private Properties
	private let viewModel: TrendingReposViewModelable
	private let refreshControl = UIRefreshControl()

	private let skeletonDataSource = TrendingReposSkeletonDataSource()
	private var dataSource: UITableViewDataSource? {
		didSet {
			tableView.dataSource = dataSource
			tableView.reloadData()
			if dataSource == nil {
				// show the lottie retry animation view
			}
			if !(dataSource is SkeletonTableViewDataSource) {
				refreshControl.endRefreshing()
				hideSkeletons()
			}
		}
	}

	// MARK: - Initializers
	init(viewModel: TrendingReposViewModelable = TrendingReposViewModel()) {
		self.viewModel = viewModel
		self.dataSource = skeletonDataSource
		super.init(nibName: "TrendingReposViewController", bundle: .main)
	}

	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

	// MARK: - IBOutlets
	@IBOutlet weak var tableView: UITableView!

	// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		self.title = viewModel.navigationBarTitle

		setupTableView()
		showSkeletons()
		fetchTrendingRepos()
    }

	// MARK: - Helper Methods
	private func setupTableView() {
		tableView.delegate = self
		tableView.refreshControl = refreshControl
		tableView.registerCell(type: RepositoryCell.self, identifier: RepositoryCell.reuseIdentifier)

		// Initialy dataSource is assigned to a SkeletonDataSource, until
		// data is fetched from the viewModel
		dataSource = skeletonDataSource

		refreshControl.addTarget(self, action: #selector(tableViewWasPulledToRefresh), for: .valueChanged)
	}

	private func fetchTrendingRepos(userInitiated: Bool = false) {
		Task {
			if let viewModels = await viewModel.getTrendingReposListViewModels() {
				// We also need to keep a strong reference to the data source,
				// since UITableView only uses a weak reference for it.
				dataSource = TrendingReposListDataSource.make(for: viewModels)
			} else {
				// Data could not be fetched from cache and service
				dataSource = nil
			}
		}
	}

	@objc private func tableViewWasPulledToRefresh() {
		dataSource = skeletonDataSource
		// We are adding a delay here intentionally, for better UX
		// and so that the user doesn't bombard the server with too many refresh requests
		DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) { [weak self] in
			self?.fetchTrendingRepos(userInitiated: true)
		}
	}
}

extension TrendingReposViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let dataSource = dataSource as? TrendingReposListDataSource<RepositoryCellViewModelable> else { return }

		tableView.deselectRow(at: indexPath, animated: true)
		dataSource.viewModels[indexPath.row].isExpanded.toggle()
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}
}

extension TrendingReposViewController {
	// MARK: - Skeleton View Helper Methods
	private func showSkeletons() {
		view.showAnimatedGradientSkeleton()
	}

	private func hideSkeletons() {
		view.stopSkeletonAnimation()
		view.hideSkeleton(transition: .crossDissolve(0.25))
	}
}
