//
//  UserCacheManager.swift
//  BaseDataSwift
//
//  Created by Poly.ma on 2018/7/25.
//

import XBaseStorage

public class UserCacheManager: AbstractMemoryCacheManager {
    
    public static let `shared` = UserCacheManager()
    
    public override func expireTime() -> TimeInterval {
        return 60 * 60 * 2
    }
}


