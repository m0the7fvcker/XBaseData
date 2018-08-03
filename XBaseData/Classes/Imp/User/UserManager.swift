//
//  UserManager.swift
//  BaseDataSwift
//
//  Created by Poly.ma on 2018/7/25.
//

import UIKit
import XBaseStorage

class UserManager {
    
    var databaseMgr = DatabaseManager.default
    
    func fetchUserDataFromDatabase() -> UserModel? {
    
        guard let userKey = SandBoxUtil.shared.getDataFromUserDefault(forKey: CurrentUserKey) else {
            return nil
        }
        return databaseMgr.selectObject(ofType: UserModel.self, forPromaryKey: userKey)
    }
    
    func syncUserInfoInDatabase(userInfo: UserModel) {
        
        databaseMgr.beginOperation { (handler) in
            do {
                try handler.write {
                    handler.add(userInfo, update: true)
                }
            } catch _ {
                print("数据库同步失败")
            }
        }
    }
    
    func removeUserInfoFromDatabase() {
        
        guard let currentUser = fetchUserDataFromDatabase() else {
            print("数据库删除当前用户失败")
            return
        }
            
        databaseMgr.beginOperation { (handler) in
            do {
                try handler.write {
                    handler.delete(currentUser)
                }
            } catch _ {
                print("数据库删除当前用户失败")
            }
        }
    }
}
