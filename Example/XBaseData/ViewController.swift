//
//  ViewController.swift
//  XBaseData
//
//  Created by Poly.ma on 07/30/2018.
//  Copyright (c) 2018 Poly.ma. All rights reserved.
//

import UIKit
import XBaseData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test0()
        test1()
    }
    
    func test0() {
        let _u = TUserModel()
        _u.uid = 123
        _u.cityId.value = 888
        TUserFacadeImp().syncUserInfo(info: _u)
        if TUserFacadeImp().isLogined {
            print("入库成功")
        } else {
            print("入库失败")
        }
    }
    
    func  test1() {
        if let _u = TUserFacadeImp().currentUser {
            TUserFacadeImp().removeCurrentUserInfo(info: _u)
        }
        if TUserFacadeImp().isLogined {
            print("推出失败")
        } else {
            print("推出成功")
        }
    }

}

