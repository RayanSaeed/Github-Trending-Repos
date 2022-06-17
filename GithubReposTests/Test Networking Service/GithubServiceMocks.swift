//
//  GithubServiceMocks.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 16/06/2022.
//

import Foundation
@testable import GithubRepos

struct GithubServiceSuccessfulMock: GithubServiceable {
	func getTrendingRepos() async -> Result<TrendingReposResult, APIError> {
		return .success(.stub)
	}
}

struct GithubServiceFailureMock: GithubServiceable {
	func getTrendingRepos() async -> Result<TrendingReposResult, APIError> {
		return .failure(.noData)
	}
}

extension TrendingReposResult {
	static let stub: TrendingReposResult = {
		.init(repos: [.stub])
	}()
}

extension Repository {
	static let stub: Repository = {
		.init(
			id: 123,
			name: "Repo Name",
			owner: .stub,
			description: "Repo Description",
			language: "Repo Language",
			starsCount: 456)
	}()
}

typealias Owner = Repository.Owner
extension Owner {
	static let stub: Owner = {
		.init(id: 789, login: "Owner Login", avatarUrl: "www.ownerAvatarUrl.com")
	}()
}
