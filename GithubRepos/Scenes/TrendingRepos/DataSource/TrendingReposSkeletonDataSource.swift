//
//  TrendingReposSkeletonDataSource.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 17/06/2022.
//

import Foundation
import SkeletonView

class TrendingReposSkeletonDataSource: NSObject, SkeletonTableViewDataSource {

	func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
		return RepositoryCell.reuseIdentifier
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(
			withIdentifier: RepositoryCell.reuseIdentifier,
			for: indexPath
		)

		cell.contentView.showAnimatedGradientSkeleton()

		return cell
	}
}
