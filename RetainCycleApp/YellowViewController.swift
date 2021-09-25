//
//  YellowViewController.swift
//  RetainCycleApp
//
//  Created by JK on 2020/05/11.
//  Copyright © 2020 codesquad. All rights reserved.
//

import UIKit

// DispatchSource에 넣는 이벤트 클로저에서 self를 참조하고 있음 -> VC와 클로저간에 strong reference cycle이 형성됨
// 클로저의 self(YellowViewController의 인스턴스)를 weak로 선언
// 더 이상 strong reference cycle이 발생하지 않음
class YellowViewController: UIViewController {
    @IBOutlet weak var eventButton: UIButton!
    private var scrollTimerSource : DispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)

    override func viewDidLoad() {
        super.viewDidLoad()

        scrollTimerSource.schedule(deadline: DispatchTime.now(), repeating: .milliseconds(1000))
        scrollTimerSource.setEventHandler(handler: { [weak self] in
            if var frame = self?.eventButton.frame {
                frame = CGRect(x: frame.origin.x, y: frame.origin.y + 10, width: frame.size.width, height: frame.size.height)
                self?.eventButton.frame = frame
            }
        })
        scrollTimerSource.activate()
    }
    
    @IBAction func eventHandler(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
