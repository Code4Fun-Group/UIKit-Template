//
//  SceneDelegate.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	var window: UIWindow?
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		let launchManager = LaunchManager()
		launchManager.configureDependencies()
		
		if let windowScene = scene as? UIWindowScene {
			let window = UIWindow(windowScene: windowScene)
			window.rootViewController = launchManager.getSplashScreen()
			self.window = window
			window.makeKeyAndVisible()
		}
	}
	
	func sceneDidDisconnect(_ scene: UIScene) {
	}
	
	func sceneDidBecomeActive(_ scene: UIScene) {
	}
	
	func sceneWillResignActive(_ scene: UIScene) {
	}
	
	func sceneWillEnterForeground(_ scene: UIScene) {
	}
	
	func sceneDidEnterBackground(_ scene: UIScene) {
	}
}
