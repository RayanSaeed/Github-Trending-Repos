//
//  NetworkErrorView.swift
//  GithubRepos
//
//  Created by Rayan Saeed on 19/06/2022.
//

import UIKit
import Lottie

protocol NetworkErrorViewDelegate: AnyObject {
	func retryButtonWasTapped()
}

final class NetworkErrorView: UIView {

	// MARK: - Instance Properties
	weak var animationViewDelegate: NetworkErrorViewDelegate?

	// MARK: - IBOutlet
	@IBOutlet weak var animationView: AnimationView!
	@IBOutlet weak var retryButton: UIButton!

	// MARK: - Initializers
	override init(frame: CGRect) {
		super.init(frame: frame)
		configureView()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		configureView()
	}

	// MARK: - View Life Cycle
	private func configureView() {
		guard let view = self.fromNib(nibName: "NetworkErrorView") else { return }
		view.frame = self.bounds
		self.addSubview(view)

		setupAnimationView()
		setupRetryButton()
	}

	private func setupAnimationView() {
		animationView.animation = .named("lottie_badNetwork")
		animationView.loopMode = .loop
		animationView.play()
	}

	private func setupRetryButton() {
		retryButton.layer.cornerRadius = 8
		retryButton.layer.borderWidth = 2
		retryButton.layer.borderColor = UIColor.systemGreen.cgColor
	}

	// MARK: - IBAction
	@IBAction func retryButtonTapped(_ sender: Any) {
		animationViewDelegate?.retryButtonWasTapped()
		removeFromSuperview()
	}

}
