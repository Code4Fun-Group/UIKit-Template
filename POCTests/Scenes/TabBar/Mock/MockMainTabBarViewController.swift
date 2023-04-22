//
//  MockMainTabBarViewController.swift
//  POCTests
//
//  Created by HieuMice on 30/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation
@testable import _DEV__POC

class MockMainTabBarViewController: IMainTabBarViewController {
	var showViewControllerCalled: Int = 0
	var showCurrentViewControllerCalled: Int = 0
	
	func showViewControllers(viewModel: GetChildViewControllerUseCase.ViewModel) {
		showViewControllerCalled += 1
	}
	
	func showCurrentViewController(viewModel: SelectTabBarUseCase.ViewModel) {
		showCurrentViewControllerCalled += 1
	}
}
