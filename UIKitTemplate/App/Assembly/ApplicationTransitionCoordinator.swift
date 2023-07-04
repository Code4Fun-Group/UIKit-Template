//
//  ApplicationTransitionCoordinator.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

// swiftlint:disable function_body_length

import UIKit
import Common
import CommonUI

struct ApplicationTransitionCoordinator: IApplicationTransitionCoordinator, IPageSheetTransitionCoordinator {
	let keyWindow = UIApplication.shared.windows.first
	
	func navigate(_ transitionType: TransitionType, animated: Bool) throws {
		switch transitionType {
		case .push(let transition):
			let viewController = try resolve(transition: transition)
			if (viewController as? UINavigationController) != nil {
				presentFullScreenModal(viewController, animated: animated)
			} else {
				present(viewController, animated: animated)
			}
			
		case .pop(let viewController):
			pop(from: viewController, animated: animated)
			
		case .popFrom(let viewController, let toViewController):
			pop(from: viewController, toViewController: toViewController, animated: animated)
			
		case .tab(let transition):
			let viewController = try resolve(transition: transition)
			tab(viewController: viewController)
			
		case .present(let transition):
			let viewController = try resolve(transition: transition)
			presentModal(viewController, animated: animated)
			
		case .presentPageSheet(let transition):
			let viewController = try resolve(transition: transition)
			presentPageSheetContainer(viewController, animated: animated)
			
		case .presentDismissablePageSheet(let transition):
			let viewController = try resolve(transition: transition)
			presentDismissablePageSheetContainer(viewController, animated: animated)
			
		case .presentPageSheetAlert(let transition):
			let viewController = try resolve(transition: transition)
			presentPageSheetAlert(viewController, animated: animated)
			
		case .presentPageSheetDialogue(let transition):
			let viewController = try resolve(transition: transition)
			presentPageSheetDialogue(viewController, animated: animated)
			
		case .presentPageSheetEmbedded(let transition):
			let viewController = try resolve(transition: transition)
			presentPageSheetEmbedded(viewController, animated: animated)
			
		case .presentFullScreen(let transition):
			let viewController = try resolve(transition: transition)
			presentFullScreenModal(viewController, animated: animated)
			
		case .presentFullScreenCrossDissolve(let transition):
			let viewController = try resolve(transition: transition)
			presentFullScreenModalCrossDissolve(viewController, animated: animated)
			
		case .cardFlip(let transition):
			if let flipTransition = transition as? FlipTransition {
				let viewController = try resolve(transition: transition)
				self.presentCardFlip(from: flipTransition.fromViewContoller, to: viewController, animated: animated)
			}
			
		case .presentOverCurrentContext(let transition):
			let viewController = try resolve(transition: transition)
			presentOverCurrentContext(viewController, animated: animated)
			
		case .dismiss(let completion):
			guard let window = keyWindow else {
				assertionFailure("Application must have UIWindow in UIApplicationDelegate")
				return
			}
			
			if let rootViewController = window.rootViewController {
				let parentController = childViewController(rootViewController)
				parentController.dismiss(animated: animated, completion: completion)
			}
		}
	}
	
	func resolve(transition: ITransition) throws -> UIViewController {
		let viewController = try AssemblyContainer.shared.resolve(transition)
		return viewController
	}
	
	func present(_ viewController: UIViewController, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		
		if let rootViewController = window.rootViewController {
			let parentController = childViewController(rootViewController)
			parentController.navigationController?.pushViewController(viewController, animated: animated)
		}
	}
	
	func childViewController(_ fromViewController: UIViewController) -> UIViewController {
		if let tabBar = fromViewController as? UITabBarController {
			if let selectedViewController = tabBar.selectedViewController {
				return childViewController(selectedViewController)
			}
		}
		
		if let navigationController = fromViewController as? UINavigationController {
			if let lastViewController = navigationController.viewControllers.last {
				return childViewController(lastViewController)
			}
		}
		
		if let modalViewController = fromViewController.presentedViewController {
			return childViewController(modalViewController)
		}
		
		if let pageSheet = childViewControllerFromPageSheet(fromViewController) {
			return childViewController(pageSheet)
		}
		
		return fromViewController
	}
	
	func presentModal(_ viewController: UIViewController, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		
		if let rootViewController = window.rootViewController {
			let parentController = childViewController(rootViewController)
			viewController.modalPresentationStyle = .fullScreen
			parentController.present(viewController, animated: animated)
		}
	}
	
	func presentPageSheetContainer(_ viewController: UIViewController, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		if let rootViewController = window.rootViewController {
			let parentController = childViewController(rootViewController)
			presentPageSheetContainer(modalViewController: viewController, on: parentController, animated: animated, completion: nil)
		}
	}
	
	func presentDismissablePageSheetContainer(_ viewController: UIViewController, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		if let rootViewController = window.rootViewController {
			let parentController = childViewController(rootViewController)
			presentDismissablePageSheetContainer(modalViewController: viewController, on: parentController, animated: animated, completion: nil)
		}
	}
	
	func presentPageSheetAlert(_ viewController: UIViewController, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		if let rootViewController = window.rootViewController {
			let parentController = childViewController(rootViewController)
			presentPageSheetAlert(modalViewController: viewController, on: parentController, animated: animated, completion: nil)
		}
	}
	
	func presentPageSheetDialogue(_ viewController: UIViewController, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		if let rootViewController = window.rootViewController {
			let parentController = childViewController(rootViewController)
			presentPageSheetDialogue(modalViewController: viewController, on: parentController, animated: animated, completion: nil)
		}
	}
	
	func presentPageSheetEmbedded(_ viewController: UIViewController, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		if let rootViewController = window.rootViewController {
			let parentController = childViewController(rootViewController)
			
			viewController.modalPresentationStyle = .fullScreen
			presentPageSheetEmbedded(modalViewController: viewController, on: parentController, animated: animated, completion: nil)
		}
	}
	
	func presentCardFlip(from fromViewController: UIViewController?, to toViewController: UIViewController?, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		
		if let rootViewController = window.rootViewController, let to = toViewController {
			if let transitionDelegate = fromViewController as? UIViewControllerTransitioningDelegate {
				to.modalPresentationStyle = .custom
				to.transitioningDelegate = transitionDelegate
			}
			
			let parentController = childViewController(rootViewController)
			parentController.present(to, animated: true)
		}
	}
	
	func presentFullScreenModal(_ viewController: UIViewController, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		
		if let rootViewController = window.rootViewController {
			let parentController = childViewController(rootViewController)
			viewController.modalPresentationStyle = .fullScreen
			viewController.modalTransitionStyle = .coverVertical
			parentController.present(viewController, animated: true)
		}
	}
	
	func presentFullScreenModalCrossDissolve(_ viewController: UIViewController, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		
		if let rootViewController = window.rootViewController {
			let parentController = childViewController(rootViewController)
			viewController.modalPresentationStyle = .overCurrentContext
			viewController.modalTransitionStyle = .crossDissolve
			parentController.present(viewController, animated: true)
		}
	}
	
	func pop(from viewController: UIViewController?, animated: Bool) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}

		guard let fromViewController = viewController?.navigationController else {
			if let rootViewController = window.rootViewController {
				let parentController = childViewController(rootViewController)
				parentController.navigationController?.popViewController(animated: animated)
			} else {
				assertionFailure("ViewController not have navigationController")
			}
			return
		}
		
		fromViewController.popViewController(animated: animated)
	}
	
	func pop(from viewController: UIViewController, toViewController: UIViewController, animated: Bool) {
		guard let fromViewController = viewController.navigationController else {
			assertionFailure("ViewController not have navigationController")
			return
		}
		
		fromViewController.popToViewController(toViewController, animated: true)
	}
	
	func tab(viewController: UIViewController) {
		guard let window = keyWindow else {
			assertionFailure("Application must have UIWindow in UIApplicationDelegate")
			return
		}
		
		guard let navigationController = window.rootViewController as? UINavigationController, let tabBarController = navigationController.viewControllers.first as? UITabBarController else {
			assertionFailure("Application must have UITabBarController")
			return
		}
		
		guard let tabBarViewControllers = tabBarController.viewControllers else {
			return
		}
		
		let selectedViewController = childViewController(viewController)
		var selectedViewControllerInTabBarIndex: Int?
		for (index, childViewController) in tabBarViewControllers.compactMap({ childViewController($0) }).enumerated() {
			if childViewController.isKind(of: type(of: selectedViewController)) {
				selectedViewControllerInTabBarIndex = index
				break
			}
		}
		
		guard let selectedIndex = selectedViewControllerInTabBarIndex else {
			return
		}
		
		tabBarController.selectedIndex = selectedIndex
	}
	
	func presentOverCurrentContext(_ viewController: UIViewController, animated: Bool) {
		guard let window = keyWindow,
			  let rootViewController = window.rootViewController else {
			assertionFailure("Application must have UIWindow and RootViewController in UIApplicationDelegate")
			return
		}
		
		viewController.modalPresentationStyle = .overCurrentContext
		rootViewController.present(viewController, animated: animated)
	}
}
