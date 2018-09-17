//
//  CountService.swift
//  ios-rxswift-practice-hot
//
//  Created  on 2018/09/17.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import RxSwift

class CountService {
    private let disposeBag = DisposeBag()
    func count() -> Observable<Int> {
        return Observable<Int>
            .interval(1.0, scheduler: MainScheduler.instance)
            .map{Int($0)}.debug()
        
    }
}

