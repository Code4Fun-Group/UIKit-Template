//
//  HomePresenter.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation

protocol IHomePresenter {
}

protocol IHomeViewController: AnyObject {
}

struct HomePresenter {
	weak var viewController: IHomeViewController?
}

extension HomePresenter: IHomePresenter {
	
}
