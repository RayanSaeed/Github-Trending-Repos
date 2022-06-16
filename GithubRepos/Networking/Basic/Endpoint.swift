//
//  Endpoint.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 15/06/2022.
//

import Foundation

typealias RequestHeaders = [String: String]
typealias RequestParameters = [String: Any?]

protocol Endpoint {
	var scheme: String { get }

	var baseURL: String { get }

	var path: String { get }

	var method: HTTPMethod { get }

	var headers: RequestHeaders? { get }

	var parameters: RequestParameters? { get }
}

extension Endpoint {

	public func urlRequest() -> URLRequest? {
		guard let url = url() else { return nil }

		var request = URLRequest(url: url)

		request.httpMethod = method.rawValue
		request.allHTTPHeaderFields = headers
		request.httpBody = jsonBody

		return request
	}

	private func url() -> URL? {
		var components = URLComponents()
		components.scheme = scheme
		components.host = baseURL
		components.path = "/" + path
		components.queryItems = queryItems

		guard let url = components.url else { return nil }
		return url
	}

	private var queryItems: [URLQueryItem]? {
		guard method == .get, let parameters = parameters else {
			return nil
		}
		return parameters.map { key, value in
			URLQueryItem(name: key, value: "\(value ?? "")")
		}
	}

	private var jsonBody: Data? {
		guard method != .get, let parameters = parameters else {
			return nil
		}

		var jsonBody: Data?
		do {
			jsonBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
		} catch {
			print(error)
		}
		return jsonBody
	}
}
