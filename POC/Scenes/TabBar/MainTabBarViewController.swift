//
//  MainTabBarViewController.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit

private enum Constants {
}

class MainTabBarViewController: UITabBarController {
	// MARK: - Outlets
	
	// MARK: - Variables
	var interactor: IMainTabBarInteractor!
	var router: IMainTabBarRouter!
	
	// MARK: Lifecycles
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		addObserver()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: false)
		getChildViewControllers(isForceReload: false)
	}
}

// MARK: - Setup UI
private extension MainTabBarViewController {
	func setupUI() {
		delegate = self
		
		applayTabBarTheme()
		updateTabBarItemAppearance()
	}
	
	func applayTabBarTheme() {
		UITabBar.appearance().shadowImage = UIImage()
		UITabBar.appearance().backgroundImage = UIImage()
		UITabBar.appearance().clipsToBounds = true
		let bgView: UIImageView = UIImageView(image: UIImage(named: "tab-background"))
		bgView.frame = tabBar.bounds
		tabBar.addSubview(bgView)
		tabBar.sendSubviewToBack(bgView)
	}
	
	func addObserver() {
	}
	
	func updateTabBarItemAppearance() {
		UITabBarItem.appearance().badgeColor = UIColor.red
		UITabBarItem.appearance().setBadgeTextAttributes([.font: UIFont.systemFont(ofSize: 8), .foregroundColor: UIColor.white], for: .normal)
	}
}

// MARK: - Actions
private extension MainTabBarViewController {
}

// MARK: - Interactor
extension MainTabBarViewController {
	func select(at index: Int) {
		let request = SelectTabBarUseCase.Request(index: index)
		interactor.selectTabBarItem(request: request)
	}
	
	func getChildViewControllers(isForceReload: Bool) {
		let request = GetChildViewControllerUseCase.Request(isForceReload: isForceReload)
		interactor.getChildViewControllers(request: request)
	}
}

// MARK: - IMainTabBarViewController
extension MainTabBarViewController: IMainTabBarViewController {
	func showViewControllers(viewModel: GetChildViewControllerUseCase.ViewModel) {
		viewControllers = viewModel.viewControllers
	}
	
	func showCurrentViewController(viewModel: SelectTabBarUseCase.ViewModel) {
		selectedIndex = viewModel.index
	}
}

// MARK: UITabBarControllerDelegate
extension MainTabBarViewController: UITabBarControllerDelegate {
	func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
		guard let viewControllers = tabBarController.viewControllers else {
			return false
		}
		let selectedIndex = viewControllers.firstIndex(of: viewController) ?? tabBarController.selectedIndex
		select(at: selectedIndex)
		return false
	}
}
