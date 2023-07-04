//
//  SplashPresenter.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation

protocol ISplashPresenter {
	func presentAuthen(response: CheckAuthenticationUseCase.Response)
}

protocol ISplashViewController: AnyObject {
	func showAuthen(viewModel: CheckAuthenticationUseCase.ViewModel)
}

struct SplashPresenter {
	weak var viewController: ISplashViewController?
}

extension SplashPresenter: ISplashPresenter {
	func presentAuthen(response: CheckAuthenticationUseCase.Response) {
		let viewModel = CheckAuthenticationUseCase.ViewModel(accessToken: response.accessToken)
		viewController?.showAuthen(viewModel: viewModel)
	}
}
