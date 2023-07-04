//
//  DependencyResolver.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common
import CommonUI
import Networking

private enum Constant {}

class DependencyResolver {

	// MARK: - Variables
	let fontSet: IFontSet
	
	// MARK: - Service
	let persistentStoreService: IPersistentStoreService!
	let securedStoreService: ISecuredStoreService!
	let apiService: MobileBFFAPIService
	let tokenService: ITokenService
	
	// MARK: - Singleton
	static let shared = DependencyResolver()
	
	private init() {
		// MARK: - App
		fontSet = DefaultFontSet()
		securedStoreService = SecuredStoreService()
		persistentStoreService = PersistentStoreService()
		tokenService = TokenService(securedStoreService: securedStoreService)
		
		// MARK: - Networking
		let networkingService = NetworkingService(
			configurations: NetworkConfigurations(),
			httpHeaderHandler: NetworkHTTPHeaderHandler(tokenService: tokenService),
			responseHandler: NetworkHTTPResponseHandler(),
			networkConnectionHandler: NetworkConnectionHandler())
		
		apiService = MobileBFFAPIService(client: networkingService,
										 query: MobileBFFResourceQueryAdapter(config: ConfigurationProvider.default),
										 resourceHandler: MobileBFFResourceResponseAdapter(jsonHandler: JSONDataHandler()))
	}
}
