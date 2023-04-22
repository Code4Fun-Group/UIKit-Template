//
//  MockMainTabBarPresenter.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
import Common
@testable import _DEV__POC

class MockMainTabBarPresenter: IMainTabBarPresenter {
	var presentViewControllerCalled = 0
	func presentViewControllers(response: GetChildViewControllerUseCase.Response) {
		presentViewControllerCalled += 1
	}
	
	var presentCurrentViewControllerCalled = 0
	func presentCurrentViewController(response: SelectTabBarUseCase.Response) {
		presentCurrentViewControllerCalled += 1
	}
}
