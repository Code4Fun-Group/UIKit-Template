//
//  MainTabBarViewControllerTests.swift
//  POCTests
//
//  Created by HieuMice on 30/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class MainTabBarViewControllerTests: XCTestCase {
	var interactor: MockMainTabBarInteractor!
	var router: MockMainTabBarRouter!
	var viewcontroller: MainTabBarViewController!
	
	override func setUpWithError() throws {
		interactor = MockMainTabBarInteractor()
		router = MockMainTabBarRouter()
		viewcontroller = MainTabBarViewController()
		viewcontroller.interactor = interactor
		viewcontroller.router = router
	}
	
	override func tearDownWithError() throws {
		interactor = nil
		router = nil
		viewcontroller = nil
	}
	
	func testMainTabBarViewController_selectTabBarItemCalled() {
		//Act
		viewcontroller.select(at: 0)
		
		//Assert
		XCTAssertEqual(interactor.selectTabBarItem, 0)
	}
	
	func testMainTabBarViewController_getChildViewControllersCalled() {
		//Act
		viewcontroller.getChildViewControllers(isForceReload: true)
		
		//Assert
		XCTAssertEqual(interactor.isForceReload, true)
	}
	
	func testMainTabBarViewController_showViewControllers_ReturnListViewcontroller() {
		//Arrange
		let viewModel = GetChildViewControllerUseCase.ViewModel(viewControllers: [LoginViewController()])
		
		//Act
		viewcontroller.showViewControllers(viewModel: viewModel)
		
		//Assert
		XCTAssertEqual(viewcontroller.viewControllers?.count, 1, "The showViewControllers() dont return list viewcontroller when set in showViewControllers() function")
	}
	
	func testMainTabBarViewController_showViewControllers_ReturnNullListViewcontroller() {
		//Arrange
		let viewModel = GetChildViewControllerUseCase.ViewModel(viewControllers: [])
		
		//Act
		viewcontroller.showViewControllers(viewModel: viewModel)
		
		//Assert
		XCTAssertNil(viewcontroller.viewControllers, "The showViewControllers() dont return list null viewcontroller when set in showViewControllers() function")
	}
	
	func testMainTabBarViewController_showCurrentViewController_ReturnListViewcontroller() {
		//Arrange
		let viewModel = GetChildViewControllerUseCase.ViewModel(viewControllers: [LoginViewController()])
		
		//Act
		viewcontroller.showViewControllers(viewModel: viewModel)
		viewcontroller.showCurrentViewController(viewModel: SelectTabBarUseCase.ViewModel(index: 0))
		
		//Assert
		XCTAssertEqual(viewcontroller.selectedIndex, 0, "The showCurrentViewController() dont return selected index when set in showCurrentViewController() function")
	}
	
	func testMainTabBarViewController_tabBarController_ShouldReturnFalse() {
		//Arrange
		let viewModel = GetChildViewControllerUseCase.ViewModel(viewControllers: [LoginViewController()])
		
		//Act
		viewcontroller.showViewControllers(viewModel: viewModel)
		let isShouldSelect: Bool = viewcontroller.tabBarController(viewcontroller, shouldSelect: viewcontroller)
		
		//Assert
		XCTAssertFalse(isShouldSelect)
	}
	
	func testMainTabBarViewController_WhenTabBarControllerNil_ShouldReturnFalse() {
		//Act
		let isShouldSelect: Bool = viewcontroller.tabBarController(viewcontroller, shouldSelect: viewcontroller)
		
		//Assert
		XCTAssertFalse(isShouldSelect)
	}
}
