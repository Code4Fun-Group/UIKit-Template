//
//  MainTabBarPresenterTests.swift
//  POCTests
//
//  Created by HieuMice on 30/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class MainTabBarPresenterTests: XCTestCase {
	var mainTabbarPresenter: MainTabBarPresenter!
	var viewcontroller: MockMainTabBarViewController!
	
	override func setUpWithError() throws {
		viewcontroller = MockMainTabBarViewController()
		mainTabbarPresenter = MainTabBarPresenter(viewController: viewcontroller)
	}
	
	override func tearDownWithError() throws {
		mainTabbarPresenter = nil
		viewcontroller = nil
	}
	
	func testMainTabbarPresenter_CallFunctionShowViewcontroller_RequiredCalledOneTime() {
		//Arrange
		let response = GetChildViewControllerUseCase.Response(pages: [TabBarPageModel(title: "Login Screen", iconName: "login_icon", viewController: LoginViewController())])
		
		//Act
		mainTabbarPresenter.presentViewControllers(response: response)
		
		//Assert
		XCTAssertEqual(viewcontroller.showViewControllerCalled, 1, "The showViewControllers() was not call")
		XCTAssertEqual(viewcontroller.showCurrentViewControllerCalled, 0, "The showCurrentViewController() was call")
	}
	
	func testMainTabbarPresenter_CallFunctionShowCurrentViewcontroller_RequiredCalledOneTime() {
		//Arrange
		let response = SelectTabBarUseCase.Response(index: 0)
		
		//Act
		mainTabbarPresenter.presentCurrentViewController(response: response)
		
		//Assert
		XCTAssertEqual(viewcontroller.showViewControllerCalled, 0, "The showViewControllers() was call")
		XCTAssertEqual(viewcontroller.showCurrentViewControllerCalled, 1, "The showCurrentViewController() was not call")
	}
}
