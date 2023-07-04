//
//  LoginPresenter.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//

import Foundation

protocol ILoginPresenter {
}

protocol ILoginViewController: AnyObject {
}

struct LoginPresenter {
	weak var viewController: ILoginViewController?
}

extension LoginPresenter: ILoginPresenter {
	
}
