//
//  SelectTabBarUseCase.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation

enum SelectTabBarUseCase {
	struct Request {
		var index: Int
	}
	
	struct Response {
		var index: Int
	}
	
	struct ViewModel {
		var index: Int
	}
}
