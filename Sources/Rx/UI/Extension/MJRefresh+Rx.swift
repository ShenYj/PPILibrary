//
//  MJRefresh+Rx.swift
//  Colin
//
//  Created by zsw on 2019/6/26.
//  Copyright © 2019 希声. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import MJRefresh

public extension Reactive where Base: MJRefreshComponent {
    
    var refreshing: ControlEvent<Void> {
        let source = Observable<Void>.create { [weak control = base] observer in
            MainScheduler.ensureRunningOnMainThread()
            
            guard let control = control else {
                observer.on(.completed)
                return Disposables.create()
            }
            
            let tatget = MJRefreshTarget(control: control, callback: { _ in
                observer.on(.next(()))
            })
            return Disposables.create(with: tatget.dispose)
        }
        .take(until: deallocated)
        return ControlEvent(events: source)
    }
    
    public var endRefreshing: Binder<Void> {
        return Binder(base) { (control, _) in
            if control.state != .noMoreData {
                control.endRefreshing()
            }
        }
    }
}

public extension Reactive where Base: MJRefreshFooter {
    
    public var noMoreData: Binder<Void> {
        return Binder(base) { (control, noMoreData) in
            control.endRefreshingWithNoMoreData()
        }
    }
    
    public var resetNoMoreData: Binder<Void> {
        return Binder(base) { (control, _) in
            control.resetNoMoreData()
        }
    }
    
    public var endRefreshingOrNoMoreData: Binder<Bool> {
        return Binder(base) { (control, noMoreData) in
            if noMoreData {
                control.endRefreshingWithNoMoreData()
            } else {
                control.endRefreshing()
            }
        }
    }
    
    //var endRefreshingWithFaild: Binder<Bool> {
    //    return Binder(base) { (control, requestFaild) in
    //        guard let control = control as? MJRefreshBackStateFooter else { return }
    //        if requestFaild {
    //            control.setTitle("加载请求失败, 请重试", for: MJRefreshState.idle)
    //        }
    //        else {
    //            control.setTitle("上拉加载更多", for: MJRefreshState.idle)
    //        }
    //    }
    //}
}

final class MJRefreshTarget: ColinTarget {
    
    typealias Callback = (MJRefreshComponent) -> Void
    
    let selector: Selector = #selector(MJRefreshTarget.eventHandler)
    
    weak var control: MJRefreshComponent?
    var callback: Callback?
    
    init(control: MJRefreshComponent, callback: @escaping Callback) {
        MainScheduler.ensureRunningOnMainThread()
        
        self.control = control
        self.callback = callback
        
        super.init()
        
        control.setRefreshingTarget(self, refreshingAction: selector)

    }
    
    @objc func eventHandler() {
        if let callback = self.callback, let control = self.control {
            callback(control)
        }
    }
    
    override func dispose() {
        super.dispose()
        self.control?.refreshingTarget = nil
        //self.control?.refreshingAction = nil
        self.callback = nil
    }
}


class ColinTarget: NSObject, Disposable {
    private var retainSelf: ColinTarget?
    
    override init() {
        super.init()
        self.retainSelf = self
        #if TRACE_RESOURCES
        _ = Resources.incrementTotal()
        #endif
    }
    
    func dispose() {
        self.retainSelf = nil
    }
    
    #if TRACE_RESOURCES
    deinit {
        _ = Resources.decrementTotal()
    }
    #endif
}
