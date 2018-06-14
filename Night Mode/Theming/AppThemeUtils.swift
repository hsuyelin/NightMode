//
//  AppThemeUtils.swift
//  Night Mode
//
//  Created by hsuyelin on 2018/6/14.
//  Copyright © 2018年 Late Night Swift. All rights reserved.
//

import Foundation

class AppThemeUtils {
    public static func saveThemeId(_ themeId: String) {
        let newThemeId = themeId.isBlank ? "0" : themeId
        UserDefaults.standard.set(newThemeId, forKey: AppThemeIdPreferencesFlag)
    }
    
    public static func readThemeId() -> String {
        let themeId: String? = UserDefaults.standard.string(forKey: AppThemeIdPreferencesFlag)
        if let themeIdNew = themeId {
            return themeIdNew.isBlank ? "0" : themeIdNew
        }
        else {
            return "0"
        }
    }
    
    public static func readCurrentIndex() -> Int {
        return Int(readThemeId()) ?? 0
    }
    
    public static func getCurrentTheme(_ availableThemes: Array<AppTheme>) -> AppTheme{
        if availableThemes.isEmpty { return AppTheme.light}
        let currentSavedThemeId = AppThemeUtils.readThemeId()
        var currentSavedTheme: AppTheme = .light
        for item in availableThemes {
            if item.themeId == currentSavedThemeId {
                currentSavedTheme = item
                break
            }
        }
        return currentSavedTheme
    }
}
