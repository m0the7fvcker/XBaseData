//
//  TUserCacheManager.swift
//  TBaseDataSwift
//
//  Created by Poly.ma on 2018/7/25.
//

import XBaseStorage

public class TUserCacheManager: AbstractMemoryCacheManager {
    
    public static let `shared` = TUserCacheManager()
    
    public override func expireTime() -> TimeInterval {
        return 60 * 60 * 2
    }
}


