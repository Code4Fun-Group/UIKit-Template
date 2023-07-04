//
//  TabBarPageModel.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit

protocol ITabBarPageModel {
	var title: String { get }
	var iconName: String { get }
	var iconActiveName: String { get }
	var badge: String? { get }
	var viewController: UIViewController { get }
}

struct TabBarPageModel: ITabBarPageModel {
	var title: String
	var iconName: String
	var badge: String?
	var viewController: UIViewController
}

extension TabBarPageModel {
	var iconActiveName: String {
		iconName + "-active"
	}
}
