//
//  Endpoint.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 15/06/2022.
//

import Foundation

/// Type alias used for HTTP request headers.
typealias RequestHeaders = [String: String]

/// Type alias used for HTTP request parameters.
/// Used for query parameters in GET requests and in the HTTP body for POST, PUT and PATCH requests.
typealias RequestParameters = [String: Any?]

protocol Endpoint {
	/// The scheme of our endpoint. e.g. `http` or `https`
	var scheme: String { get }

	/// The base URL of our API, to be prepended with endpoint paths.
	var baseURL: String { get }

	/// The path that will be appended to API's base URL (must includ /).
	var path: String { get }

	/// The HTTP method.
	var method: HTTPMethod { get }

	/// The HTTP headers.
	var headers: RequestHeaders? { get }

	/// The request parameters.
	var parameters: RequestParameters? { get }
}

extension Endpoint {

	/////////////////////
	// MARK: - PUBLIC
	/////////////////////

	/// Creates a URLRequest from this instance.
	/// - Parameter environment: The environment against which the `URLRequest` must be constructed.
	/// - Returns: An optional `URLRequest`.
	public func urlRequest() -> URLRequest? {
		// Create the base URL.
		guard let url = url() else { return nil }

		// Create a request with that URL.
		var request = URLRequest(url: url)

		// Append all related properties.
		request.httpMethod = method.rawValue
		request.allHTTPHeaderFields = headers

		return request
	}

	/////////////////////
	// MARK: - PRIVATE
	/////////////////////

	/// Creates a URL with all the components.
	/// - Returns: An optional `URL`.
	private func url() -> URL? {
		// Create a URLComponents instance to compose the url.
		var components = URLComponents()
		components.scheme = scheme
		components.host = baseURL
		components.path = path
		components.queryItems = queryItems

		guard let url = components.url else { return nil }
		return url
	}

	/// Returns the `URLQueryItem`(s) for the given URLRequest
	private var queryItems: [URLQueryItem]? {
		// Checks for a GET request and nil-check for parameters.
		guard method == .get, let parameters = parameters else { return nil }
		// Convert parameters to query items.
		return parameters.map { key, value in
			URLQueryItem(name: key, value: "\(value ?? "")")
		}
	}
}
