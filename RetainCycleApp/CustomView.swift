//
//  CustomView.swift
//  RetainCycleApp
//
//  Created by JK on 2020/05/12.
//  Copyright © 2020 codesquad. All rights reserved.
//

import UIKit

// 에러가 발생했음
// class를 따르지 않는 프로토콜을 weak 변수로 선언해 사용할 때 발생하는 에러라고 함
// https://jusung.github.io/classOnlyProtocol/를 참고하여 프로토콜이 class를 따르도록 선언함
// Using 'class' keyword for protocol inheritance is deprecated; use 'AnyObject' instead
// 더 이상 strong reference cycle이 발생하지 않음
protocol  CustomDelegate: AnyObject {
    func foo(_ value: Int)
}

class CustomView: UIView {
    @IBOutlet weak var titleLabel : UILabel!
    var openValue = 0 {
        didSet {
            delegate?.foo(openValue)
            titleLabel.text = String(openValue)
        }
    }
    
    weak var delegate : CustomDelegate? = nil

    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.systemOrange
    }
}
