//
//  GithubRepoResponse.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 15/06/2022.
//

import Foundation

struct GithubRepoResponse: Codable, Equatable {
	let repos: [GithubRepo]

	private enum CodingKeys: String, CodingKey {
		case repos = "items"
	}
}
