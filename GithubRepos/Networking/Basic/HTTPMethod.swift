//
//  HTTPMethod.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 15/06/2022.
//

import Foundation

/// HTTP request methods.
enum HTTPMethod: String {

	/// HTTP GET - to retrieve a resource
	case get = "GET"

	// For now we only need GET.
	// But we can add other methods as well if needed as follows:

	/// HTTP POST - to create a resource
	case post = "POST"

	/// HTTP PUT - to replace a resource
	case put = "PUT"

	/// HTTP PATCH - to update a resource
	case patch = "PATCH"

	/// HTTP DELETE - to delete a resource
	case delete = "DELETE"
}
