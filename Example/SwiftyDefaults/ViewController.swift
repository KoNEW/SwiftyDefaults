//
//  ViewController.swift
//  SwiftDefaults
//
//  Created by shimesaba9 on 01/12/2016.
//  Copyright (c) 2016 shimesaba9. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let md = MyDefaults()
        
        print("Value1: \(md.value1)") // nil
        print("Value2: \(md.value2)") // "Some value"
        print("Value3: \(md.value3)") // 1
        print("Value4: \(md.value4)") // nil
        
        md.value1 = "Some another value"
        md.value2 = "Some another value 2"
        md.value3 = 10
        md.value4 = Person(firstName: "Elvis", lastName: "Presley", age: 42)
        
        print("Value1: \(md.value1)") // Optional("Some another value")
        print("Value2: \(md.value2)") // "Some an0ther value 2"
        print("Value3: \(md.value3)") // 10
        print("Value4: \(md.value4)") // Optional(Person=(Optional("Elvis"), Optional("Presley"), 42))
    }
}
