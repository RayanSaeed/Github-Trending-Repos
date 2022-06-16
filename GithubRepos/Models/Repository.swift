//
//  Repository.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 15/06/2022.
//

import Foundation

struct Repository: Codable, Equatable, Identifiable {
	/// ID of the repository
	let id: Int

	/// Name of the repository
	let name: String

	/// Owner of the repository
	let owner: Owner

	/// Description of the repository
	let description: String?

	/// Primary language of the repository
	let language: String?

	/// Stars count of the repository
	let starsCount: Int

	enum CodingKeys: String, CodingKey {
		case id, name, owner, description, language
		case starsCount = "stargazers_count"
	}
}

extension Repository {
	struct Owner: Codable, Equatable, Identifiable {
		/// ID of the owner
		let id: Int

		/// Name of the repository's owner
		let login: String

		/// Url of owner's avatar
		let avatarUrl: String

		enum CodingKeys: String, CodingKey {
			case id, login
			case avatarUrl = "avatar_url"
		}
	}
}
