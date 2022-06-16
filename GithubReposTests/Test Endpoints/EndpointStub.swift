//
//  EndpointStub.swift
//  GithubReposTests
//
//  Created by Rayan Saeed on 15/06/2022.
//

import Foundation
@testable import GithubRepos

enum EndpointStub {
	case simple
	case withParams
	case withHeaders
	case withParamsAndHeaders
}

extension EndpointStub: Endpoint {
	var scheme: String {
		switch self {
			case .simple:
				return "http"
			case .withParams, .withHeaders, .withParamsAndHeaders:
				return "https"
		}
	}

	var baseURL: String {
		"api.example.com"
	}

	var path: String {
		switch self {
			case .simple:
				return "simplePath"
			case .withParams:
				return "pathWithParams"
			case .withHeaders:
				return "pathWithHeaders"
			case .withParamsAndHeaders:
				return "pathWithParamsAndHeaders"
		}
	}

	var method: HTTPMethod { .get }

	var headers: RequestHeaders? {
		switch self {
			case .simple, .withParams:
				return nil
			case .withHeaders, .withParamsAndHeaders:
				return [ "headerKey": "headerValue" ]
		}
	}

	var parameters: RequestParameters? {
		switch self {
			case .simple, .withHeaders:
				return nil
			case .withParams, .withParamsAndHeaders:
				return ["paramKey": "paramValue"]
		}
	}
}
