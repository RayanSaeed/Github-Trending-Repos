//
//  RepositoryCellViewModelMocks.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 17/06/2022.
//

import Foundation
@testable import GithubRepos

struct RepositoryCellExpandedViewModelMock: RepositoryCellViewModelable {
	var isExpanded: Bool = expandedStub.isExpanded
	var name: String = expandedStub.name
	var ownerLogin: String = expandedStub.ownerLogin
	var description: String = expandedStub.description
	var language: String = expandedStub.language
	var starsCount: String = expandedStub.starsCount
	var avatarUrl: URL = expandedStub.avatarUrl
}

struct RepositoryCellCollapsedViewModelMock: RepositoryCellViewModelable {
	var isExpanded: Bool = collapsedStub.isExpanded
	var name: String = collapsedStub.name
	var ownerLogin: String = collapsedStub.ownerLogin
	var description: String = collapsedStub.description
	var language: String = collapsedStub.language
	var starsCount: String = collapsedStub.starsCount
	var avatarUrl: URL = collapsedStub.avatarUrl
}

extension RepositoryCellExpandedViewModelMock {

	static let expandedStub: RepositoryCellViewModel = {
		var stub = RepositoryCellViewModel.stub
		stub.isExpanded = true
		return stub
	}()
}

extension RepositoryCellCollapsedViewModelMock {

	static let collapsedStub: RepositoryCellViewModel = {
		var stub = RepositoryCellViewModel.stub
		stub.isExpanded = false
		return stub
	}()
}

extension RepositoryCellViewModel {
	static let stub: RepositoryCellViewModel = {
		.init(
			name: "Repo Name",
			ownerLogin: "Owner Name",
			description: "Repo Description",
			language: "Repo Language",
			starsCount: "123",
			avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/8598858?v=4")!)
	}()
}
