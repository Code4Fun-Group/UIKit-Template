//
//  MobileBFFResourceQueryAdapter.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common
import Networking

protocol IMobileBFFResourceQueryAdapter {}

struct MobileBFFResourceQueryAdapter: IMobileBFFResourceQueryAdapter {
	let config: IConfiguration
}
