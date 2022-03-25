//
//  ViewController.swift
//  iOSDemo
//
//  Created by EZen on 2021/11/29.
//

import UIKit
import PPILibrary

class ViewController: UIViewController {
    
    private lazy var btn: UIButton = {
        let button = UIButton()
        button.setTitle("test", for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 5
        button.layer.maskedCorners = .allCorner
        button.titleLabel?.font = UIFont.SYS_F15
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(btn)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = TestViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

