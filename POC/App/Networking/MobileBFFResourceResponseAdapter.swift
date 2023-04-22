//
//  MobileBFFResourceResponseAdapter.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Common
import Networking

protocol IMobileBFFResourceResponseAdapter: INetworkErrorResponseHandler {}

struct MobileBFFResourceResponseAdapter: IMobileBFFResourceResponseAdapter {
	let jsonHandler: JSONDataHandler
}

extension MobileBFFResourceResponseAdapter: INetworkErrorResponseHandler {
	func handle(errorData: Data?, completion: @escaping (IServerResponseError?) -> Void) {
		jsonHandler.handle(jsonData: errorData) { (result: Result<ServerErrorResponse, Error>) in
			switch result {
			case .success(let serverError):
				let serverError = ServerResponseError(message: serverError.error, name: "", status: serverError.statusCode)
				completion(serverError)
			case .failure(let error):
				let serverError = ServerResponseError(message: error.localizedDescription, name: "", status: nil)
				completion(serverError)
			}
		}
	}
}
