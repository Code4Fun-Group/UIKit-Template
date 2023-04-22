//
//  HomeViewController.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
	// MARK: - Outlets
	
	// MARK: - Variables
	var interactor: IHomeInteractor!
	var router: IHomeRouter!
	
	// MARK: Lifecycles
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}
}

// MARK: - Setup UI
extension HomeViewController {
	func setupUI() {
	}
}

// MARK: - Actions
private extension HomeViewController {
}

// MARK: - Interactor
private extension HomeViewController {
}

// MARK: - IHomeViewController
extension HomeViewController: IHomeViewController {
}
