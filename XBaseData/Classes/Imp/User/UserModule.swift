//
//  UserModule.swift
//  BaseData
//
//  Created by Poly.ma on 2018/8/3.
//

import UIKit
import XMidware

class UserModule: NormalPriorityModule, IModuleComponent {
    
    override func modulerInit(_ context: Context) {
        print("\(self)   \(#function)")
        
        UserMigrator.startMigrateIfNeeded()
    }
}
