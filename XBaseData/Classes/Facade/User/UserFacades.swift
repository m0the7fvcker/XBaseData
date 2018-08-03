//
//  UserFacades.swift
//  BaseDataSwift
//
//  Created by Poly.ma on 2018/7/25.
//

import UIKit

public protocol UserFacades {
    
    /// 获取当前用户
    var currentUser: UserModel? { get }
    
    /// 获取登陆状态
    var isLogined: Bool { get }
    
    /// 持久化用户信息
    func syncUserInfo(info: UserModel)
    
    /// 获取当前用户信息，先从缓存加载，再从数据库
    func fetchCurrentUserInfo() -> UserModel?
    
    /// 删除用户信息
    func removeCurrentUserInfo(info: UserModel)
    
}
