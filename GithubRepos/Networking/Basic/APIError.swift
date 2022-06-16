//
//  APIError.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 16/06/2022.
//

import Foundation

/// Enum of API Errors
enum APIError: Error, Equatable {
	/// No data received from the server.
	case noData

	/// The URL was invalid.
	case invalidURL

	/// The server response was invalid (unexpected format).
	case invalidResponse

	/// The request was rejected: 400-499
	case badRequest(String?)

	/// Encountered a server error.
	case server(String?)

	/// There was an error parsing the data.
	case decoding(String?)

	/// Unknown error.
	case unknown(String?)
}
