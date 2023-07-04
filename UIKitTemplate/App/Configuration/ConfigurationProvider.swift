//
//  ConfigurationProvider.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation

enum ConfigurationProvider: IConfiguration {
	case `default`
	
	enum Keys {
		static let apiKey = "API_KEY"
	}
	
	enum Paths {
		static let apiPath = "API_PATH"
	}
	
	var apiKey: String {
		Configuration.value(for: Keys.apiKey)
	}
	
	var apiPath: String {
		Configuration.value(for: Paths.apiPath)
	}
}
