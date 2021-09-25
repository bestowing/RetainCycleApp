//
//  ViewController.swift
//  RetainCycleApp
//
//  Created by JK on 2020/05/11.
//  Copyright © 2020 codesquad. All rights reserved.
//

import UIKit

// nemesis로 다른 Robot 클래스를 참조하는 상황
// 로봇 1과 로봇 2가 서로를 참조하고 있으니 strong memory cycle이 형성됨
// weak로 선언
// 더 이상 strong memory cycle이 발생하지 않음
class Robot : NSObject {
    var name : String
    weak var nemesis : Robot?
    var model : Int
    
    override init() {
        name = ""
        nemesis = nil
        model = 0
    }

    deinit {
        print("robot was deinit")
    }
}
class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            var robot1 : Robot? = Robot()
            var robot2 : Robot? = Robot()

            robot1?.name = "JK"
            robot1?.nemesis = robot2
            
            robot2?.name = "HAL"
            robot2?.nemesis = robot1

            robot1 = nil
            robot2 = nil
        }
    }
}

