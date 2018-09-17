//
//  ViewModel.swift
//  ios-rxswift-practice-hot
//
//  Created on 2018/09/17.
//  Copyright © 2018 . All rights reserved.
//

import RxCocoa
import RxSwift

final class TimerViewModel {
    
    let service: CountService
    
    struct Input {
        let startButtonTapTrigger: Driver<Void>
    }
    
    struct Output {
        let count: Driver<String>
    }
    
    init(useCase: CountService) {
        service = useCase
    }
    
    func transform(input: Input) -> Output {
        let count = input.startButtonTapTrigger.flatMapLatest { _ in
            return self.service.count()
            .map{String(describing: $0)}.debug()
            .asDriver(onErrorJustReturn:"カウント失敗")
        }
        
        return Output(
            count: count
        )
    }
}
