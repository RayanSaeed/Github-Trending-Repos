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
	let name: String = expandedStub.name
	let ownerLogin: String = expandedStub.ownerLogin
	let description: String = expandedStub.description
	let language: String = expandedStub.language
	let starsCount: String = expandedStub.starsCount
	let avatarUrl: URL = expandedStub.avatarUrl
}

struct RepositoryCellCollapsedViewModelStub: RepositoryCellViewModelable {
	var isExpanded: Bool = collapsedStub.isExpanded
	let name: String = collapsedStub.name
	let ownerLogin: String = collapsedStub.ownerLogin
	let description: String = collapsedStub.description
	let language: String = collapsedStub.language
	let starsCount: String = collapsedStub.starsCount
	let avatarUrl: URL = collapsedStub.avatarUrl
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
