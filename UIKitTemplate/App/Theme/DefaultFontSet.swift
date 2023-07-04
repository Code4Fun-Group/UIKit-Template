//
//  DefaultFontSet.swift
//  POC
//
//  Created by Max Nguyen on 20/08/2022.
//  Copyright © 2022 Techvify. All rights reserved.
//

import CommonUI

struct DefaultFontSet: IFontSet {
	func font(style: FontStyle) -> UIFont {
		return UIFont.systemFont(ofSize: 10)
	}
}
