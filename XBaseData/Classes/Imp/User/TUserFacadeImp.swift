//
//  TUserFacadeImp.swift
//  TBaseDataSwift
//
//  Created by Poly.ma on 2018/7/25.
//

import XBaseStorage

let TCurrentUserKey = "TCurrentUserKey"

public class TUserFacadeImp {
    public init() {}
}

extension TUserFacadeImp: TUserFacades {

    public var currentUser: TUserModel? {
        get {
            return fetchCurrentUserInfo()
        }
    }
    
    public var isLogined: Bool {
        get {
            if let _ = SandBoxUtil.shared.getDataFromUserDefault(forKey: TCurrentUserKey) {
                return true
            }
            return false
        }
    }
    
    public func updateUserCompanyInfo(success:(() -> Void), failure:(() -> Void)) {
        
    }
    
    public func syncUserInfo(info userInfo: TUserModel) {
        // uid存入沙盒
        SandBoxUtil.shared.saveDataToUserDefualt(object: userInfo.uid, forKey: TCurrentUserKey)
        // 缓存同步最新用户信息
        TUserCacheManager.shared.cache(object: userInfo, forKey: TCurrentUserKey)
        // 数据库同步用户最新信息
        TUserManager().syncUserInfoInDatabase(userInfo: userInfo)
    
    }
    
    public func fetchCurrentUserInfo() -> TUserModel? {
        if let cacheUser = TUserCacheManager.shared.cache(forKey: TCurrentUserKey) as? TUserModel {
            return cacheUser
        }
        if let dbUser = TUserManager().fetchUserDataFromDatabase() {
            return dbUser
        }
        return nil
    }
    
    public func removeCurrentUserInfo(info: TUserModel) {
        // 数据库清除
        TUserManager().removeUserInfoFromDatabase()
        // 沙盒移除uid
        SandBoxUtil.shared.removeDataFromUserDefault(forKey: TCurrentUserKey)
        // 缓存清除
        TUserCacheManager.shared.removeVaule(forKey: TCurrentUserKey)
    }
}
