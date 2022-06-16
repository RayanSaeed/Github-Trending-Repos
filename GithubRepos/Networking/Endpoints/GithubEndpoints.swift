//
//  GithubEndpoints.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 16/06/2022.
//

import Foundation

enum GithubEndpoint {
	case trendingRepos
}

extension GithubEndpoint: Endpoint {
	var scheme: String { "https" }

	var baseURL: String { "api.github.com" }

	var path: String {
		switch self {
			case .trendingRepos:
				return "/search/repositories"
		}
	}

	var method: HTTPMethod { .get }

	var headers: RequestHeaders? {
		[
			"Accept": "application/vnd.github.v3+json",
			"Content-Type": "application/json;charset=utf-8"
		]
	}

	var parameters: RequestParameters? {
		["q": "language=+sort:stars"]
	}
}
