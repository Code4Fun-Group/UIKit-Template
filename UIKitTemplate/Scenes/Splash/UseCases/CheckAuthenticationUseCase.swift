//
//  CheckAuthenticationUseCase.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit

enum CheckAuthenticationUseCase {
	struct Request {}
	
	struct Response {
		var accessToken: String?
	}
	
	struct ViewModel {
		var accessToken: String?
	}
}
