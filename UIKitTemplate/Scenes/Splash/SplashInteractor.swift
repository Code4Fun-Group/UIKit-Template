//
//  SplashInteractor.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation

protocol ISplashInteractor {
	func checkAuthen(request: CheckAuthenticationUseCase.Request)
}

struct SplashInteractor {
	var worker: ISplashWorker
	var presenter: ISplashPresenter
}

extension SplashInteractor: ISplashInteractor {
	func checkAuthen(request: CheckAuthenticationUseCase.Request) {
		let response = CheckAuthenticationUseCase.Response(accessToken: worker.accessToken)
		presenter.presentAuthen(response: response)
	}
}
