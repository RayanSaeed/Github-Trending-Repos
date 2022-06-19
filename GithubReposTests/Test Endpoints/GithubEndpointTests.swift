//
//  GithubEndpointTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 17/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

final class GithubEndpointTests: XCTestCase {

	func testGithubTrendingEndpoint_requestGeneration() throws {
		let sut = GithubEndpoint.trendingRepos

		let request = try XCTUnwrap(sut.urlRequest())
		let url = try XCTUnwrap(request.url)
		let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: true))

		expect(components.scheme).to(equal("https"))
		expect(components.host).to(equal("api.github.com"))
		expect(components.path).to(equal("/search/repositories"))
		expect(components.queryItems?.count).to(equal(1))
		expect(components.queryItems).to(equal([URLQueryItem(name: "q", value: "language=+sort:stars")]))
		expect(request.httpMethod).to(equal("GET"))
		expect(request.allHTTPHeaderFields).to(equal(
			[
				"Accept": "application/vnd.github.v3+json",
				"Content-Type": "application/json;charset=utf-8"
			]
		))
	}
}
