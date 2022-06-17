//
//  TrendingReposViewModelMocks.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 17/06/2022.
//

import Foundation
@testable import GithubRepos

final class TrendingReposViewModelSuccessfulMock: TrendingReposViewModelable {
	var service: GithubServiceable

	var navigationBarTitle: String { .mockTitle }

	init(service: GithubServiceable = GithubServiceSuccessfulMock()) {
		self.service = service
	}

	func fetchTrendingRepos() async -> TrendingReposResult? {
		return .mock
	}
}

final class TrendingReposViewModelFailureMock: TrendingReposViewModelable {
	var service: GithubServiceable

	var navigationBarTitle: String { .mockTitle }

	init(service: GithubServiceable = GithubServiceFailureMock()) {
		self.service = service
	}

	func fetchTrendingRepos() async -> TrendingReposResult? {
		return nil
	}
}

extension String {
	static var mockTitle: String { "MockTitle" }
}
