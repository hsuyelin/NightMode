//
//  AppThemeExtension.swift
//  Night Mode
//
//  Created by hsuyelin on 2018/6/14.
//  Copyright © 2018年 Late Night Swift. All rights reserved.
//

import Foundation

public extension String {
    
    var isBlank: Bool {
        return isEmpty || trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
