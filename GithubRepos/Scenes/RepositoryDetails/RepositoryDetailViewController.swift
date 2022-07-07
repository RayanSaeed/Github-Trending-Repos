//
//  RepositoryDetailViewController.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 23/06/2022.
//

import UIKit

class RepositoryDetailViewController: UIViewController {

	// MARK: - Instance Properties
	var repoDescription: String

	// MARK: - Initializers
	init(desciprtion: String) {
		self.repoDescription = desciprtion
		super.init(nibName: "RepositoryDetailViewController", bundle: .main)
	}

	required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

	// MARK: - IBOutlets
	@IBOutlet weak var descriptionLabel: UILabel!

	// MARK: - View Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()

		descriptionLabel.text = repoDescription
	}
}
