//
//  LoginInteractor.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//

import Foundation

protocol ILoginInteractor {
}

struct LoginInteractor {
	var worker: ILoginWorker
	var presenter: ILoginPresenter
}

extension LoginInteractor: ILoginInteractor {
	
}
