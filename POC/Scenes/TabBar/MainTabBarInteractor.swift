//
//  MainTabBarInteractor.swift
//  POC
//
//  Created by Max Nguyen on 21/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import Foundation

protocol IMainTabBarInteractor {
	func selectTabBarItem(request: SelectTabBarUseCase.Request)
	func getChildViewControllers(request: GetChildViewControllerUseCase.Request)
}

struct MainTabBarInteractor {
	var worker: IMainTabBarWorker
	var presenter: IMainTabBarPresenter
}

extension MainTabBarInteractor: IMainTabBarInteractor {
	func selectTabBarItem(request: SelectTabBarUseCase.Request) {
		worker.saveSelected(at: request.index)
		let tabBarSelectResponse = SelectTabBarUseCase.Response(index: worker.selectedIndex)
		presenter.presentCurrentViewController(response: tabBarSelectResponse)
	}
	
	func getChildViewControllers(request: GetChildViewControllerUseCase.Request) {
		if !request.isForceReload {
			guard !worker.isTabBarLoaded else {
				return
			}
		}
		let tabBarSelectResponse = SelectTabBarUseCase.Response(index: worker.selectedIndex)
		worker.getAvailablePageViews { pageViews in
			let pageViewsResponse = GetChildViewControllerUseCase.Response(pages: pageViews)
			presenter.presentViewControllers(response: pageViewsResponse)
			presenter.presentCurrentViewController(response: tabBarSelectResponse)
		}
	}
}
