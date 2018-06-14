//
//  CustomView.swift
//  Night Mode
//
//  Created by hsuyelin on 2018/6/13.
//  Copyright © 2018年 Late Night Swift. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: 0.0, y: 20.0, width: self.frame.size.width, height: 20.0))
        titleLabel.text = "自定义View主标题"
        titleLabel.font = UIFont.systemFont(ofSize: 17.0)
        return titleLabel
    }()
    
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel.init(frame: CGRect(x: 0.0, y: 45.0, width: self.frame.size.width, height: 20.0))
        subTitleLabel.text = "自定义View副标题"
        subTitleLabel.font = UIFont.systemFont(ofSize: 15.0)
        return subTitleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        placeSubViews()
        setUpTheming()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func placeSubViews() {
        addSubview(titleLabel)
        addSubview(subTitleLabel)
    }
}

extension CustomView: Themed {
    
    func applyTheme(_ theme: AppTheme) {
        self.backgroundColor = theme.backgroundColor
        titleLabel.textColor = theme.textColor
        subTitleLabel.textColor = theme.textColor
        
        let flag = AppThemeProvider().isNight() == true ? "夜间模式" : "日间模式"
        print("biu biu biu 切换到了" + flag)
    }
}
