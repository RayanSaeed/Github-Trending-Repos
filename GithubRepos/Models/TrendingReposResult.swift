//
//  TrendingReposResult.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 15/06/2022.
//

import Foundation

struct TrendingReposResult: Codable, Equatable {
	let repos: [Repository]

	private enum CodingKeys: String, CodingKey {
		case repos = "items"
	}
}
