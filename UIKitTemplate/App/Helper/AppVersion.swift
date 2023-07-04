//
//  AppVersion.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import UIKit

private enum Constants {
	static let dateFormatLocale = "en_US_POSIX"
	static let platform = "iOS"
}

class AppVersion {
	class func getAppVersionString(_ string: String,
								   infoDictionary: [String: Any]? = Bundle.main.infoDictionary) -> String {
		guard let info = infoDictionary else {
			return ""
		}
		guard let version = info["CFBundleShortVersionString"] as? String else {
			return ""
		}
		guard let build = info["CFBundleVersion"] as? String else {
			return ""
		}
		
		let date = Date()
		let format = DateFormatter()
		format.dateFormat = "yyyy"
		format.locale = Locale(identifier: Constants.dateFormatLocale)
		let year = format.string(from: date)
		
		guard let yearCopyright = Int(year) else {
			return ""
		}
		
		let appVersion = String(format: string, arguments: [version, build, "", yearCopyright])
		return appVersion
	}
	
	class func getPlatform() -> String {
		return Constants.platform
	}
	
	class func getVersion(infoDictionary: [String: Any]? = Bundle.main.infoDictionary) -> String {
		guard let info = infoDictionary else {
			return ""
		}
		guard let version = info["CFBundleShortVersionString"] as? String else {
			return ""
		}
		
		return version
	}
}
