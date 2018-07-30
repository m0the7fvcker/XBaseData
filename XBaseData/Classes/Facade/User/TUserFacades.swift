//
//  TUserFacades.swift
//  TBaseDataSwift
//
//  Created by Poly.ma on 2018/7/25.
//

import UIKit

protocol TUserFacades {
    
    /// 获取当前用户
    var currentUser: TUserModel? { get }
    
    /// 获取登陆状态
    var isLogined: Bool { get }
    
    /// 根据用户信息更新用户模型
    func updateUserCompanyInfo(success:(() -> Void), failure:(() -> Void))
    
    /// 持久化用户信息
    func syncUserInfo(info: TUserModel)
    
    /// 获取当前用户信息，先从缓存加载，再从数据库
    func fetchCurrentUserInfo() -> TUserModel?
    
    /// 删除用户信息
    func removeCurrentUserInfo(info: TUserModel)
    
}
