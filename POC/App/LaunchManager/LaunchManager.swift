//
//  LaunchManager.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit
import Common

struct LaunchManager {
	func configureDependencies() {
		// Common
		let splashAssembly = SplashAssembly(tokenService: DependencyResolver.shared.tokenService)
		let loginAssembly = LoginAssembly()
		let homeAssembly = HomeAssembly()
		let mainTabBarAssembly = MainTabBarAssembly(homeAssembly: homeAssembly)
		
		// AssemblyContainer
		AssemblyContainer.shared.transitionCoordinator = ApplicationTransitionCoordinator()
		AssemblyContainer.register(splashAssembly,
								   loginAssembly,
								   mainTabBarAssembly,
								   homeAssembly)
	}
}
