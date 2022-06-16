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

	func testEndpoint_basicRequestGeneration() throws {
		let sut = EndpointStub.simple

		let request = try XCTUnwrap(sut.urlRequest())
		let url = try XCTUnwrap(request.url)
		let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: true))

		expect(components.scheme).to(equal("http"))
		expect(components.host).to(equal("api.example.com"))
		expect(components.path).to(equal("/simplePath"))
		expect(components.queryItems?.count).to(beNil())
		expect(request.allHTTPHeaderFields).to(be([:]))
	}

	func testEndpoint_requestGeneration_withParams() throws {
		let sut = EndpointStub.withParams

		let request = try XCTUnwrap(sut.urlRequest())
		let url = try XCTUnwrap(request.url)
		let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: true))

		expect(components.scheme).to(equal("https"))
		expect(components.host).to(equal("api.example.com"))
		expect(components.path).to(equal("/pathWithParams"))
		expect(components.queryItems?.count).to(equal(1))
		expect(components.queryItems).to(equal([URLQueryItem(name: "paramKey", value: "paramValue")]))
		expect(request.allHTTPHeaderFields).to(be([:]))
	}

	func testEndpoint_requestGeneration_withHeaders() throws {
		let sut = EndpointStub.withHeaders

		let request = try XCTUnwrap(sut.urlRequest())
		let url = try XCTUnwrap(request.url)
		let components = try XCTUnwrap(URLComponents(url: url, resolvingAgainstBaseURL: true))

		expect(components.scheme).to(equal("https"))
		expect(components.host).to(equal("api.example.com"))
		expect(components.path).to(equal("/pathWithHeaders"))
		expect(components.queryItems?.count).to(beNil())
		expect(request.allHTTPHeaderFields).to(equal(["headerKey": "headerValue"]))
	}

	func testEndpoint_requestGeneration_withParamsAndHeaders() throws {
		let sut = EndpointStub.withParamsAndHeaders

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
