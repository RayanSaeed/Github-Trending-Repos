//
//  GithubServiceMock.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 16/06/2022.
//

import Foundation
@testable import GithubRepos

final class GithubServiceSuccessfulMock: Mockable, GithubServiceable {
	func getTrendingRepos() async -> Result<GithubRepoResponse, APIError> {
		return .success(.mock)
	}
}

final class GithubServiceFailureMock: Mockable, GithubServiceable {
	func getTrendingRepos() async -> Result<GithubRepoResponse, APIError> {
		return .failure(.noData)
	}
}

extension GithubRepoResponse {
	static let mock: GithubRepoResponse = {
		.init(repos: [.mock])
	}()
}

extension GithubRepo {
	static let mock: GithubRepo = {
		.init(
			id: 123,
			name: "Repo Name",
			owner: .mock,
			description: "Repo Description",
			language: "Repo Language",
			starsCount: 456)
	}()
}

extension GithubRepoOwner {
	static let mock: GithubRepoOwner = {
		.init(id: 789, login: "Owner Login", avatarUrl: "www.ownerAvatarUrl.com")
	}()
}
