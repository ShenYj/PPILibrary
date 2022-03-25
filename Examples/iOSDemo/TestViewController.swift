//
//  TestViewController.swift
//  iOSDemo
//
//  Created by EZen on 2022/3/14.
//

import UIKit

class TestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
    
    func dealloc() {
        print("\(#function)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("\(#function)")
    }
    
}
