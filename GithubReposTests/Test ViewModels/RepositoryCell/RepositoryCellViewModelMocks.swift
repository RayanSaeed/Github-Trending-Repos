//
//  RepositoryCellViewModelMocks.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 17/06/2022.
//

import Foundation
@testable import GithubRepos

struct RepositoryCellExpandedViewModelStub: RepositoryCellViewModelable {
	var isExpanded: Bool = expandedStub.isExpanded
	var name: String = expandedStub.name
	var ownerLogin: String = expandedStub.ownerLogin
	var description: String = expandedStub.description
	var language: String = expandedStub.language
	var starsCount: String = expandedStub.starsCount
	var avatarUrl: URL = expandedStub.avatarUrl
}

struct RepositoryCellCollapsedViewModelStub: RepositoryCellViewModelable {
	var isExpanded: Bool = collapsedStub.isExpanded
	var name: String = collapsedStub.name
	var ownerLogin: String = collapsedStub.ownerLogin
	var description: String = collapsedStub.description
	var language: String = collapsedStub.language
	var starsCount: String = collapsedStub.starsCount
	var avatarUrl: URL = collapsedStub.avatarUrl
}

extension RepositoryCellExpandedViewModelStub {

	static let expandedStub: RepositoryCellViewModel = {
		var stub = RepositoryCellViewModel.stub
		stub.isExpanded = true
		return stub
	}()
}

extension RepositoryCellCollapsedViewModelStub {

	static let collapsedStub: RepositoryCellViewModel = {
		var stub = RepositoryCellViewModel.stub
		stub.isExpanded = false
		return stub
	}()
}

extension RepositoryCellViewModel {
	static let stub: RepositoryCellViewModel = {
		let repo = Repository.stub
		let owner = Owner.stub

		return .init(
			name: repo.name,
			ownerLogin: owner.login,
			description: repo.description!,
			language: repo.language!,
			starsCount: "\(repo.starsCount)",
			avatarUrl: URL(string: "\(owner.avatarUrl)")!)
	}()
}
