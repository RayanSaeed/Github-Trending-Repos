//
//  TrendingReposViewModel.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 17/06/2022.
//

import Foundation

protocol TrendingReposViewModelable {

	/// An object conforming to the `GithubServiceable` protocol
	var service: GithubServiceable { get }

	/// A string that is to be used as the NavigationVC's bar title.
	var navigationBarTitle: String { get }

	/// Initializes the ViewModel with an object conforming to `GithubServiceable` protocol
	///
	/// - Parameter service:
	/// 	Any object conforming to `GithubServiceable`. Default value: `GithubService()`
	init(service: GithubServiceable)


	/// Fetches the Trending Github repositories using the `service` injected into the
	/// viewModel. The response is cached and shall not be fetched again from the network
	/// until either the response's age expires, or the user explicitly asks to fetch data.
	///
	/// - Returns: An optional `TrendingReposResult`
	func fetchTrendingRepos() async -> TrendingReposResult?
}

struct TrendingReposViewModel: TrendingReposViewModelable {

	var service: GithubServiceable
	var navigationBarTitle: String { "Trending" }

	init(service: GithubServiceable = GithubService()) {
		self.service = service
	}

	func fetchTrendingRepos() async -> TrendingReposResult? {
		let reposResult = await service.getTrendingRepos()

		switch reposResult {
			case .success(let result):
				return result
			case .failure(let error):
				debugPrint(error)
				return nil
		}
	}
}
