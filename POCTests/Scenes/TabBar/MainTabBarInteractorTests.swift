//
//  MainTabBarInteractorTests.swift
//  POCTests
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class MainTabBarInteratorTests: XCTestCase {
	var interactor: MainTabBarInteractor!
	var presenter: MockMainTabBarPresenter!
	var worker: MockMainTabBarWorker!
	
	override func setUpWithError() throws {
		try super.setUpWithError()
		worker = MockMainTabBarWorker()
		presenter = MockMainTabBarPresenter()
		interactor = MainTabBarInteractor(worker: worker, presenter: presenter)
	}
	
	override func tearDownWithError() throws {
		try super.tearDownWithError()
		interactor = nil
		presenter = nil
		worker = nil
	}
	
	func testInteractorChangeTabBarAndUpdateSelectedIndex() {
		
		// given
		let request = SelectTabBarUseCase.Request(index: 2)
		
		// when
		interactor.selectTabBarItem(request: request)
		
		// then
		XCTAssertEqual(worker.selectedIndex, 2, "Interactor selectedIndex should update index value")
		XCTAssertEqual(presenter.presentCurrentViewControllerCalled, 1, "Interactor should call presentCurrentViewController")
	}
	
	func testInteractorGetViewControllersFirstTimes() {
		
		// given
		worker.isTabBarLoaded = false
		let request = GetChildViewControllerUseCase.Request(isForceReload: false)
		
		// when
		interactor.getChildViewControllers(request: request)
		
		// then
		XCTAssertEqual(presenter.presentViewControllerCalled, 1, "Interactor should call presentViewController")
	}
	
	func testInteractorGetViewControllersSecondTimes() {
		
		// given
		worker.isTabBarLoaded = true
		let request = GetChildViewControllerUseCase.Request(isForceReload: false)
		
		// when
		interactor.getChildViewControllers(request: request)
		
		// then
		XCTAssertEqual(presenter.presentViewControllerCalled, 0, "Interactor should not call presentViewController")
	}
}
