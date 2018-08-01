//
//  TUserManager.swift
//  TBaseDataSwift
//
//  Created by Poly.ma on 2018/7/25.
//

import UIKit
import XBaseStorage

class TUserManager {
    
    var databaseMgr = DatabaseManager.default
    
    func fetchUserDataFromDatabase() -> TUserModel? {
    
        return databaseMgr.selectObject(ofType: TUserModel.self, forPromaryKey: SandBoxUtil.shared.getDataFromUserDefault(forKey: TCurrentUserKey)!)
    }
    
    func syncUserInfoInDatabase(userInfo: TUserModel) {
        
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
