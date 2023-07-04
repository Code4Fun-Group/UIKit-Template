//
//  LaunchManager+Startup.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common

extension LaunchManager {
	func getSplashScreen() -> UIViewController {
		do {
			let viewController = try AssemblyContainer.shared.resolve(Transition(name: "Splash"))
			return viewController
		} catch {
			assertionFailure("AssemblyNotFound")
		}
		return UIViewController()
	}

	func startup() -> UIViewController {
		do {
			let viewController = try AssemblyContainer.shared.resolve(Transition(name: "MainTabBar"))
			return viewController
		} catch {
			assertionFailure("AssemblyNotFound")
		}
		return UIViewController()
	}
}
