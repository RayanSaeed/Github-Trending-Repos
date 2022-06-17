//
//  TrendingReposViewModel.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 17/06/2022.
//

import Foundation

protocol TrendingReposViewModelable {
	var service: GithubServiceable { get }

	init(service: GithubServiceable)
	func fetchTrendingRepos() async -> TrendingReposResult?
}

final class TrendingReposViewModel: ObservableObject, TrendingReposViewModelable {
	let service: GithubServiceable

	init(service: GithubServiceable = GithubService()) {
		self.service = service
	}

	func fetchTrendingRepos() async -> TrendingReposResult? {
		switch await service.getTrendingRepos() {
			case .success(let result):
				return result
			case .failure(let error):
				debugPrint(error)
				return nil
		}
	}
}
