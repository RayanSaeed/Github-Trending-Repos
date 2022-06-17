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
	/// - Returns: An optional array of viewModels i.e. `[RepositoryCellViewModelable]`
	func getTrendingReposListViewModels() async -> [RepositoryCellViewModelable]?
}

struct TrendingReposViewModel: TrendingReposViewModelable {

	var service: GithubServiceable
	var navigationBarTitle: String { "Trending" }

	init(service: GithubServiceable = GithubService()) {
		self.service = service
	}

	func getTrendingReposListViewModels() async -> [RepositoryCellViewModelable]? {
		let reposResult = await service.getTrendingRepos()

		switch reposResult {
			case .success(let result):
				let viewModels: [RepositoryCellViewModelable] = result.repos.map {
					RepositoryCellViewModel(
						name: $0.name,
						ownerLogin: $0.owner.login,
						description: $0.description ?? "",
						language: $0.language ?? "",
						starsCount: "\($0.starsCount)",
						avatarUrl: URL(string: $0.owner.avatarUrl)!
					)
				}

				return viewModels

			case .failure(let error):
				debugPrint(error)
				return nil
		}
	}
}
