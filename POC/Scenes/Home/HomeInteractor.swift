//
//  HomeInteractor.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation

protocol IHomeInteractor {
}

struct HomeInteractor {
	var worker: IHomeWorker
	var presenter: IHomePresenter
}

extension HomeInteractor: IHomeInteractor {
	
}
