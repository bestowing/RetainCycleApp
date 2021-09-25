//
//  BlueViewController.swift
//  RetainCycleApp
//
//  Created by JK on 2020/05/11.
//  Copyright © 2020 codesquad. All rights reserved.
//

import UIKit

// addObserver에 넣는 클로저에서 self를 참조하고 있음 -> VC와 클로저간에 strong memory cycle이 형성됨
// 클로저의 self(BlueViewController의 인스턴스)를 weak로 선언
// 더 이상 strong memory cycle이 발생하지 않음
// 실수 : DispatchQueue에 넣는 클로저, inner closure에 weak self로 했더니 해결되지 않았다.
// 배운 점 : 이번 상황처럼 클로저가 중첩되어있다면 가장 바깥쪽 클로저에 weak self를 선언해야할 것 같다.
class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: PurpleViewController.NotificationSomething, object: nil, queue: nil) { [weak self] (notification) in
            DispatchQueue.main.async {
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func eventHandler(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
