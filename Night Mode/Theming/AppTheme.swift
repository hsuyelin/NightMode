//
//  AppTheme.swift
//  Night Mode
//
//  Created by Michael on 01/04/2018.
//  Copyright © 2018 Late Night Swift. All rights reserved.
//

import UIKit

struct AppTheme {
    var themeName: String
    var themeId: String
	var statusBarStyle: UIStatusBarStyle
	var barBackgroundColor: UIColor
	var barForegroundColor: UIColor
	var backgroundColor: UIColor
	var textColor: UIColor
}

extension AppTheme {
	static let light = AppTheme(
        themeName: "light",
        themeId: "0",
		statusBarStyle: .`default`,
		barBackgroundColor: .white,
		barForegroundColor: .black,
		backgroundColor: UIColor(white: 0.9, alpha: 1),
		textColor: .darkText
	)

    static let dark = AppTheme(
        themeName: "dark",
        themeId: "1",
        statusBarStyle: .lightContent,
        barBackgroundColor: UIColor(white: 0, alpha: 1),
        barForegroundColor: .white,
        backgroundColor: UIColor(white: 0.2, alpha: 1),
        textColor: .lightText
    )
}

extension AppTheme: Equatable {
    static func ==(old: AppTheme, new: AppTheme) -> Bool {
        if old.themeName == new.themeName {
            return true
        }
        else {
            return false
        }
    }
}
