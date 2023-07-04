//
//  HomeWorker.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation

protocol IHomeWorker {
}

struct HomeWorker {
	let remoteStore: IHomeRemoteStore
}

extension HomeWorker: IHomeWorker {
	
}
