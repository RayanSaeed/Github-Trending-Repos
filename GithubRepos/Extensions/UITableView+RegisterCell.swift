//
//  UITableView+RegisterCell.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 17/06/2022.
//

import Foundation
import UIKit

public extension UITableView {

	/// Register nibs faster by passing the type - if for some reason the `identifier`
	/// - Parameters:
	///   - type: The type of the tableViewCell to register e.g. `UITableViewCell.self`
	///   - identifier: The reuse identifier of the tableViewCell
	func registerCell(type: UITableViewCell.Type, identifier: String? = nil) {
		let cellId = String(describing: type)
		register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
	}
}
