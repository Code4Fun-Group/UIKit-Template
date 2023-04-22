//
//  ServerErrorResponse.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation

struct ServerErrorResponse: Codable {
	var statusCode: Int
	var error: String
	var message: [String]
}
