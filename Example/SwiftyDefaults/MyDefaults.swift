//
//  MyDefaults.swift
//  SwiftDefaults
//
//  Created by 杉本裕樹 on 2016/01/12.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyDefaults

class MyDefaults: SwiftyDefaults {
    dynamic var value1: String? = nil
    dynamic var value2: String = "Some value"
    dynamic var value3: Int = 1
    dynamic var value4: Person? = nil // Person class conforms to NSCoding procotol
}

