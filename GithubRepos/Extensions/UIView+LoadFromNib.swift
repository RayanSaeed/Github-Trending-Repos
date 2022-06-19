//
//  UIView+LoadFromNib.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 19/06/2022.
//

import Foundation
import UIKit

extension UIView {

	/// Loads a view from a nib file with the same name as the Class
	/// - Returns: A View loaded from Nib
	func fromNib(nibName: String) -> UIView? {
		let bundle = Bundle( for: type(of: self))
		let nib = UINib(nibName: nibName, bundle: bundle)
		return nib.instantiate(withOwner: self, options: nil).first as? UIView
	}
}
