//
//  EndpointStub.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 15/06/2022.
//

import Foundation
@testable import GithubRepos

enum EndpointStubValid {
	case validHost
}

extension EndpointStubValid: Endpoint {
	var scheme: String { "https" }
	var baseURL: String { "api.example.com" }
	var path: String { "/simplePath" }
	var method: HTTPMethod { .get }
	var headers: RequestHeaders? { ["headerKey": "headerValue"] }
	var parameters: RequestParameters? { ["paramKey": "paramValue"] }
}

enum EndpointStubInvalid {
	case invalidHost
}

extension EndpointStubInvalid: Endpoint {
	var scheme: String { "http" }
	var baseURL: String { "someDomain" }
	var path: String { "invalidPath" }
	var method: HTTPMethod { .get }
	var headers: RequestHeaders? { nil }
	var parameters: RequestParameters? { nil }
}
