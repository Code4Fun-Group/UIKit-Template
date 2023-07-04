//
//  GetChildViewControllerUseCase.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit

enum GetChildViewControllerUseCase {
	struct Request {
		var isForceReload: Bool
	}
	
	struct Response {
		var pages: [ITabBarPageModel]
	}
	
	struct ViewModel {
		var viewControllers: [UIViewController]
	}
}
