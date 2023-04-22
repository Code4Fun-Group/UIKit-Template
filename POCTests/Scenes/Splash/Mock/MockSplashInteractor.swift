//
//  MockSplashInteractor.swift
//  POCTests
//
//  Created by Max Nguyen on 22/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import XCTest
@testable import _DEV__POC

class MockSplashInteractor: ISplashInteractor {
	func checkAuthen(request: CheckAuthenticationUseCase.Request) {
		
	}
}

class MockSplashWorker: ISplashWorker {
	var accessToken: String?
}

class MockSplashPresenter: ISplashPresenter {
	func presentAuthen(response: CheckAuthenticationUseCase.Response) {
		
	}
}
