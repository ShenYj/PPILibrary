//
//  ViewController.swift
//  PPI_Rx_Demo
//
//  Created by EZen on 2022/3/24.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import RxGesture
import PPILibraryRx

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        
//        view.rx
//            .tapGesture()
//            .when(.recognized)
//            .subscribe(with: self) { owner, _ in
//                print("tap.")
//            }
//            .disposed(by: rx.disposeBag)
        
    }
    

}

