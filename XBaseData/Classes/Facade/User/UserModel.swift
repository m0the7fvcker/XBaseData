//
//  UserModel.swift
//  BaseDataSwift
//
//  Created by Poly.ma on 2018/7/25.
//

import UIKit
import RealmSwift

fileprivate let AdminRoleCode: String = "001001006000000001"       // 管理者的 role code
fileprivate let UserInfoPath : String = "/DecorationUserInfoCache"
fileprivate let CustomerServiceRoleCode = "001001006000000005"

public class UserModel: Object {
    
    @objc dynamic public var isAdmin: Bool = false // 是否是管理者用户
    @objc dynamic public var token: String?
    @objc dynamic public var uid: Int = 0
    public var codes = List<String>()
    public var role = RealmOptional<Int>()
    public var companyId = RealmOptional<Int>()
    public var cityAuth = RealmOptional<Int>()
    public var relatedId = RealmOptional<Int>() // 录音列表用户id
    
    // 虚拟根组织ID，相对于用户可见联系人而言，仅针对外部公司，无论其内部用户或土巴兔对外暴露的可见联系人都归在改组织下
    @objc dynamic public var rootOrgId: Int = 1
    
    public var roleCodes = List<String>() {
        didSet {
            if roleCodes.contains(AdminRoleCode) {
                isAdmin = true
            }
            isAdmin = false
        }
    }
    
    @objc dynamic public var name: String?
    @objc dynamic public var nickname: String?
    public var phoneNumber: String?
    public var phoneId = RealmOptional<Int>()
    public var boundExtId = RealmOptional<Int>()
    public var cityId = RealmOptional<Int>()
    public var townId = RealmOptional<Int>()
    @objc dynamic var agrementStatus: Int = 0
    
    // 主键
    override public class func primaryKey() -> String? {
        return "uid"
    }
    
}
