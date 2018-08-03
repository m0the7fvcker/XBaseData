//
//  UserFacadeImp.swift
//  BaseDataSwift
//
//  Created by Poly.ma on 2018/7/25.
//

import XBaseStorage
import XMidware

let CurrentUserKey = "TCurrentUserKey"

public class UserFacadeImp: IServiceComponent {
    
    public typealias Interface = UserFacades
    
    public required init() {}
    
    public static func config(_ profile: ServiceProfile<UserFacadeImp.Interface>) {
        profile.setName("UserFacades")
    }

}

extension UserFacadeImp: UserFacades {
    
    public var currentUser: UserModel? {
        get {
            return fetchCurrentUserInfo()
        }
    }
    
    public var isLogined: Bool {
        get {
            if let _ = SandBoxUtil.shared.getDataFromUserDefault(forKey: CurrentUserKey) {
                return true
            }
            return false
        }
    }
    
    public func syncUserInfo(info userInfo: UserModel) {
        // uid存入沙盒
        SandBoxUtil.shared.saveDataToUserDefualt(object: userInfo.uid, forKey: CurrentUserKey)
        // 缓存同步最新用户信息
        UserCacheManager.shared.cache(value: userInfo, forKey: CurrentUserKey)
        // 数据库同步用户最新信息
        UserManager().syncUserInfoInDatabase(userInfo: userInfo)
    
    }
    
    public func fetchCurrentUserInfo() -> UserModel? {
        if let cacheUser = UserCacheManager.shared.cache(forKey: CurrentUserKey) as? UserModel {
            return cacheUser
        }
        if let dbUser = UserManager().fetchUserDataFromDatabase() {
            return dbUser
        }
        return nil
    }
    
    public func removeCurrentUserInfo(info: UserModel) {
        // 数据库清除
        UserManager().removeUserInfoFromDatabase()
        // 沙盒移除uid
        SandBoxUtil.shared.removeDataFromUserDefault(forKey: CurrentUserKey)
        // 缓存清除
        UserCacheManager.shared.removeValue(forKey: CurrentUserKey)
    }
}
