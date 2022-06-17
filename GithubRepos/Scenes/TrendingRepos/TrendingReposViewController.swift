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

	// MARK: - Private Properties

	// MARK: - Initializers
	init(viewModel: TrendingReposViewModelable = TrendingReposViewModel()) {
		self.viewModel = viewModel
		super.init(nibName: "TrendingReposViewController", bundle: .main)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - IBOutlets

	// MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		self.title = viewModel.navigationBarTitle

		fetchTrendingRepos()
    }

	// MARK: - Helper Methods
	private func fetchTrendingRepos() {
		Task {
			_ = await viewModel.fetchTrendingRepos()
		}
	}
}
