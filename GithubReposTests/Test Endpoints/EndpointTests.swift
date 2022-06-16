//
//  EndpointTests.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 15/06/2022.
//

import XCTest
import Nimble
@testable import GithubRepos

class EndpointTests: XCTestCase {

	func testEndpoint_invalidRequestGeneration() throws {
		let sut = EndpointStubInvalid.invalidHost

		let _ = try XCTUnwrap(sut.urlRequest())
	}

	func testEndpoint_validRequestGeneration_withParamsAndHeaders() throws {
		let sut = EndpointStubValid.validHost

		let request = try XCTUnwrap(sut.urlRequest())
		let url = try XCTUnwrap(request.url)
		let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: true))

		expect(components.scheme).to(equal("https"))
		expect(components.host).to(equal("api.example.com"))
		expect(components.path).to(equal("/pathWithParamsAndHeaders"))
		expect(components.queryItems?.count).to(equal(1))
		expect(components.queryItems).to(equal([URLQueryItem(name: "paramKey", value: "paramValue")]))
		expect(request.allHTTPHeaderFields).to(equal(["headerKey": "headerValue"]))
	}
}
