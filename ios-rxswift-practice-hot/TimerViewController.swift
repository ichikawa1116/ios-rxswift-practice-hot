//
//  TimerViewController.swift
//  ios-rxswift-practice-hot
//
//  Created on 2018/09/17.
//  Copyright © 2018 . All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TimerViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countStartButton: UIButton!
     // TODO: UsecaseとViewModelはDIする
    private var viewModel = TimerViewModel(useCase: CountService())
    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        
    }
    
    func setupUI() {
        countStartButton.backgroundColor = UIColor.lightGreen
        countStartButton.layer.cornerRadius = 2
    }
    
    func bindViewModel() {
        
        let startButtonTrigger = countStartButton.rx.tap.asDriver
        
        let input = TimerViewModel.Input(
            startButtonTapTrigger: startButtonTrigger())
        
        let output = viewModel.transform(input: input)
        output.count
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }
    

}

