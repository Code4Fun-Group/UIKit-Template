//
//  MainTabBarPresenter.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit

protocol IMainTabBarPresenter {
	func presentViewControllers(response: GetChildViewControllerUseCase.Response)
	func presentCurrentViewController(response: SelectTabBarUseCase.Response)
}

protocol IMainTabBarViewController: AnyObject {
	func showViewControllers(viewModel: GetChildViewControllerUseCase.ViewModel)
	func showCurrentViewController(viewModel: SelectTabBarUseCase.ViewModel)
}

struct MainTabBarPresenter {
	weak var viewController: IMainTabBarViewController?
}

extension MainTabBarPresenter: IMainTabBarPresenter {
	func presentViewControllers(response: GetChildViewControllerUseCase.Response) {
		let viewControllers = response.pages.map { page -> UIViewController in
			let viewController = page.viewController
			viewController.tabBarItem = UITabBarItem(title: page.title, image: UIImage(named: page.iconName), selectedImage: UIImage(named: page.iconActiveName))
			return viewController
		}
		
		let viewModel = GetChildViewControllerUseCase.ViewModel(viewControllers: viewControllers)
		viewController?.showViewControllers(viewModel: viewModel)
	}
	
	func presentCurrentViewController(response: SelectTabBarUseCase.Response) {
		let viewModel = SelectTabBarUseCase.ViewModel(index: response.index)
		viewController?.showCurrentViewController(viewModel: viewModel)
	}
}
