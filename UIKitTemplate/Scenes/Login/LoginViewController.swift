//
//  LoginViewController.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//

import UIKit

class LoginViewController: UIViewController {
	// MARK: - Outlets
	
	// MARK: - Variables
	var interactor: ILoginInteractor!
	var router: ILoginRouter!
	
	// MARK: Lifecycles
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}
}

// MARK: - Setup UI
private extension LoginViewController {
	func setupUI() {
	}
}

// MARK: - Actions
private extension LoginViewController {
}

// MARK: - Interactor
private extension LoginViewController {
}

// MARK: - ILoginViewController
extension LoginViewController: ILoginViewController {
}
