//
//  AppThemeProvider.swift
//  Night Mode
//
//  Created by Michael on 01/04/2018.
//  Copyright © 2018 Late Night Swift. All rights reserved.
//

import UIKit

public let AppThemeIdPreferencesFlag = "AppThemeIdPreferencesFlag"

final class AppThemeProvider: ThemeProvider {
	static let shared: AppThemeProvider = .init()

	private var theme: SubscribableValue<AppTheme>
    var availableThemes: [AppTheme] = [.light, .dark]

	var currentTheme: AppTheme {
		get {
			return theme.value
		}
		set {
			setNewTheme(newValue)
		}
	}

	init() {
        theme = SubscribableValue<AppTheme>(value: AppThemeUtils.getCurrentTheme(availableThemes))
	}

	private func setNewTheme(_ newTheme: AppTheme) {
        if self.theme.value == newTheme { return }
        AppThemeUtils.saveThemeId(newTheme.themeId)
		let window = UIApplication.shared.delegate!.window!!
        UIView.transition(with: window, duration: 0.3, options: [ .transitionCrossDissolve ], animations: {
            self.theme.value = newTheme
        }) { (completion) in
        }
	}

	func subscribeToChanges(_ object: AnyObject, handler: @escaping (AppTheme) -> Void) {
		theme.subscribe(object, using: handler)
	}

	func nextTheme() {
        guard let nextTheme = availableThemes.nextElement(AppThemeUtils.readCurrentIndex()) else {
            return
        }
		currentTheme = nextTheme
	}
    
    func isNight() -> Bool {
        return currentTheme == .dark
    }
}

extension Themed where Self: AnyObject {
	var themeProvider: AppThemeProvider {
		return AppThemeProvider.shared
	}
}
