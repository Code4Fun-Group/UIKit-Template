//
//  TokenService.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common
import Networking

struct TokenService {
	let securedStoreService: ISecuredStoreService
}

extension TokenService: ITokenService {
	mutating func clearToken() {
		self.uid = nil
		self.accessToken = nil
	}
	
	var uid: String? {
		get {
			return securedStoreService.get(key: "uid") as? String
		}
		set {
			securedStoreService.set(value: newValue, key: "uid")
		}
	}
	
	var accessToken: String? {
		get {
			return securedStoreService.get(key: "accessToken") as? String
		}
		set {
			securedStoreService.set(value: newValue, key: "accessToken")
		}
	}
}
