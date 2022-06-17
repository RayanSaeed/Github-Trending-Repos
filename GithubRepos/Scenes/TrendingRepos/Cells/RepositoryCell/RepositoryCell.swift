//
//  RepositoryCell.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 17/06/2022.
//

import UIKit

final class RepositoryCell: UITableViewCell {

	// MARK: - Constants
	static let reuseIdentifier = "repositoryCell"

	// MARK: - IBOutlets
	@IBOutlet weak var ownerNameLabel: UILabel!
	@IBOutlet weak var repositoryNameLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var languageLabel: UILabel!
	@IBOutlet weak var starsCountLabel: UILabel!
	@IBOutlet weak var languageDotView: UIView!
	@IBOutlet weak var avatarImageView: UIImageView!
	@IBOutlet weak var detailsStackView: UIStackView!

}
