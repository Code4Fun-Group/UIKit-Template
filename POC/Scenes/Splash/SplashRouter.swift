//
//  SplashRouter.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common

protocol ISplashRouter: IRouter {
	func goToLogin()
	func goToHomePage()
}

struct SplashRouter {
}

extension SplashRouter: ISplashRouter {
	func goToLogin() {
		resetRootView(moduleName: "Login")
	}
	
	func goToHomePage() {
		resetRootView(moduleName: "MainTabBar")
	}
}
