//
//  SplashWorker.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation
import Networking

protocol ISplashWorker {
	var accessToken: String? { get }
}

struct SplashWorker {
	let tokenService: ITokenService
}

extension SplashWorker: ISplashWorker {
	var accessToken: String? {
		tokenService.accessToken
	}
}
