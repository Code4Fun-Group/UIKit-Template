//
//  LoginWorker.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//

import Foundation

protocol ILoginWorker {
	
}

struct LoginWorker {
	let remoteStore: ILoginRemoteStore
}

extension LoginWorker: ILoginWorker {
	
}
