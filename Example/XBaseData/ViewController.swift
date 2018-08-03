//
//  ViewController.swift
//  XBaseData
//
//  Created by Poly.ma on 07/30/2018.
//  Copyright (c) 2018 Poly.ma. All rights reserved.
//

import UIKit
import XBaseData
import XMidware

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test0()
//        test1()
        
        test2()
    }
    
    func test2() {
        let userImp: UserFacades = XMidware.getServer().get("UserFacades")!
        print(userImp.currentUser?.uid)
    }
    
    func  test1() {
        if let _u = UserFacadeImp().currentUser {
            UserFacadeImp().removeCurrentUserInfo(info: _u)
        }
        if UserFacadeImp().isLogined {
            print("推出失败")
        } else {
            print("推出成功")
        }
    }
    
    func test0() {
        let _u = UserModel()
        _u.uid = 123
        _u.cityId.value = 888
        UserFacadeImp().syncUserInfo(info: _u)
        if UserFacadeImp().isLogined {
            print("入库成功")
        } else {
            print("入库失败")
        }
    }
    

}

