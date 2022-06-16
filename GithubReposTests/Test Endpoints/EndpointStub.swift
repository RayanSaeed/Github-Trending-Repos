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
	var path: String { "simplePath" }
	var method: HTTPMethod { .get }
	var headers: RequestHeaders? { ["headerKey": "headerValue"] }
	var parameters: RequestParameters? { ["paramKey": "paramValue"] }
}

enum EndpointStubInvalid {
	case invalidHost
}

extension EndpointStubInvalid: Endpoint {
	var scheme: String { "" }
	var baseURL: String { "" }
	var path: String { "" }
	var method: HTTPMethod { .get }
	var headers: RequestHeaders? { ["headerKey": "headerValue"] }
	var parameters: RequestParameters? { ["paramKey": "paramValue"] }
}
