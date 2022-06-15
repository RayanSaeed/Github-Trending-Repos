//
//  GithubRepoOwner.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 15/06/2022.
//

import Foundation

struct GithubRepoOwner: Codable, Equatable, Identifiable {
	/// ID of the owner
	let id: Int

	/// Name of the repository's owner
	var login: String

	/// Url of owner's avatar
	var avatarUrl: String

	enum CodingKeys: String, CodingKey {
		case id, login
		case avatarUrl = "avatar_url"
	}
}