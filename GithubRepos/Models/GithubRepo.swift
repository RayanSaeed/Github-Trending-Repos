//
//  GithubRepo.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 15/06/2022.
//

import Foundation

struct GithubRepo: Codable, Equatable, Identifiable {
	/// ID of the repository
	let id: Int

	/// Name of the repository
	var name: String

	/// Owner of the repository
	var owner: GithubRepoOwner

	/// Description of the repository
	var description: String

	/// Primary language of the repository
	var language: String

	/// Stars count of the repository
	var starsCount: Int

	enum CodingKeys: String, CodingKey {
		case id, name, owner, description, language
		case starsCount = "stargazers_count"
	}
}

