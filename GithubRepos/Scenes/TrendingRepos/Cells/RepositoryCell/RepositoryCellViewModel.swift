//
//  RepositoryCellViewModel.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 17/06/2022.
//

import Foundation

protocol RepositoryCellViewModelable {

	/// A boolean indicating whether the cell is expanded or not.
	/// The `description`, `language` and `starCount` are visible
	/// in the expanded state only.
	var isExpanded: Bool { get set }

	/// Name of the repository
	var name: String { get }

	/// Name of the repository's owner
	var ownerLogin: String { get }

	/// Description of the repository
	var description: String { get }

	/// Primary language of the repository
	var language: String { get }

	/// Stars count of the repository
	var starsCount: String { get }

	/// Url of owner's avatar
	var avatarUrl: URL { get }
}

struct RepositoryCellViewModel: RepositoryCellViewModelable {
	var isExpanded: Bool = false
	var name: String
	var ownerLogin: String
	var description: String
	var language: String
	var starsCount: String
	var avatarUrl: URL
}
