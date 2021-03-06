//
//  GithubService.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 16/06/2022.
//

import Foundation

protocol GithubServiceable {
	/// This function makes a network request for the `trendingRepos` endpoint
	/// - Parameter loadFromCache:
	/// 	A boolean indicating whether cache is to be ignored or not.
	///
	/// - Returns:
	/// Returns a `Result` type
	///  - `success:` A model object of `GithubRepoResponse`
	///  - `failure:` An error object of `APIError`
	func getTrendingRepos(loadFromCache: Bool) async -> Result<TrendingReposResult, APIError>
}

struct GithubService: HTTPClient, GithubServiceable {
	let session: URLSession
	let decoder: JSONDecoder

	init(session: URLSession = .shared, decoder: JSONDecoder = .init()) {
		self.session = session
		self.decoder = decoder
	}

	func getTrendingRepos(loadFromCache: Bool = true) async -> Result<TrendingReposResult, APIError> {
		/*
		 Read the documentation here to understand how the caching is working here:
		 https://developer.apple.com/documentation/foundation/nsurlrequest/cachepolicy/
		 */
		await execute(
			session: session,
			endpoint: GithubEndpoint.trendingRepos,
			responseModel: TrendingReposResult.self,
			decoder: decoder,
			loadFromCache: loadFromCache
		)
	}
}
