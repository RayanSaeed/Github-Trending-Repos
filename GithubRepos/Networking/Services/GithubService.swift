//
//  GithubService.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 16/06/2022.
//

import Foundation

protocol GithubServiceable {
	/// This function makes a network request for the `trendingRepos` endpoint
	/// - Returns:
	/// Returns a `Result` type
	///  - `.success:` A model object of `GithubRepoResponse`
	///  - `.failure:` An error object of `APIError`
	func getTrendingRepos() async -> Result<GithubRepoResponse, APIError>
}

