//
//  HTTPClient.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 16/06/2022.
//

import Foundation

/// HTTPClient is a protocol with a default implementation of the `execute` function,
/// responsible for making requests to the server.
protocol HTTPClient {

	/// A function responsible for making a request to the server.
	/// As a parameter, it receives the `Endpoint` and the type of the model to decode the API response.
	///
	/// - Parameters:
	///   - session: The `URLSession` object used for making the requests.
	///   - endpoint: The `Endpoint` object.
	///   - responseModel: The type of the model to be decoded from the API response.
	///   - decoder: The `JSONDecoder` object used for decoding the response.
	///   - loadFromCache: A boolean indicating whether cache is to be ignored or not.
	///
	/// - Returns:
	/// A `Result` that can be a `success` with the decoded response or an `error`
	/// with one of the cases created in `APIError`.
	func execute<T: Decodable>(
		session: URLSession,
		endpoint: Endpoint,
		responseModel: T.Type,
		decoder: JSONDecoder,
		loadFromCache: Bool
	) async -> Result<T, APIError>
}

extension HTTPClient {
	func execute<T: Decodable>(
		session: URLSession = .shared,
		endpoint: Endpoint,
		responseModel: T.Type,
		decoder: JSONDecoder = .init(),
		loadFromCache: Bool = true
	) async -> Result<T, APIError> {
		// Create a URL request.
		guard var request = endpoint.urlRequest() else {
			return .failure(.invalidURL)
		}

		request.cachePolicy = loadFromCache ? .returnCacheDataElseLoad : .reloadIgnoringLocalCacheData

		// Execute the request with URLSessionTask's async method
		do {
			let (data, response) = try await session.data(for: request)

			// Handle the URLResponse returned from our async request
			guard let response = response as? HTTPURLResponse else {
				return .failure(.invalidResponse)
			}

			// Verify the HTTP status code.
			switch response.statusCode {
				case 200...299:
					// Try to decode the data object
					guard let decodedResponse = try? decoder.decode(responseModel, from: data) else {
						return .failure(.decoding("The data couldn't be parsed."))
					}
					return .success(decodedResponse)
				case 400...499:
					return .failure(.badRequest("Bad URL request error."))
				case 500...599:
					return .failure(.server("There was a server error."))
				default:
					return .failure(.unknown(nil))
			}
		} catch(let error) {
			return .failure(.unknown("\(error.localizedDescription)"))
		}
	}
}
