//
//  App+Router.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common
import CommonUI

public extension IRouter {
	func navigate(to transitionType: TransitionType, animated: Bool) {
		do {
			try transitionCoordinator?.navigate(transitionType, animated: animated)
		} catch {
			let routerError = error
			print(routerError)
		}
	}
	
	func resetToHome() {
		guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
			  let delegate = windowScene.delegate as? SceneDelegate,
			  let window = delegate.window else { return }
		window.rootViewController = LaunchManager().startup()
	}

	func resetReturnToTransition() {
		AssemblyContainer.shared.returnToTransition = nil
	}
}
