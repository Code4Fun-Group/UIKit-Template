//
//  MobileBFFAPIService.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common
import Networking

struct MobileBFFAPIService {
	let client: INetworkingService
	let query: IMobileBFFResourceQueryAdapter
	let resourceHandler: IMobileBFFResourceResponseAdapter

	init(client: INetworkingService,
				query: IMobileBFFResourceQueryAdapter,
				resourceHandler: IMobileBFFResourceResponseAdapter) {
		self.client = client
		self.query = query
		self.resourceHandler = resourceHandler
	}
}
