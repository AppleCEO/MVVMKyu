//
//  RxViewController.swift
//  MVVMKyu
//
//  Created by joon-ho kil on 2019/11/06.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxViewController: UIViewController {
    let viewModel = RxViewModel()
    var bag = DisposeBag()
    
    @IBAction func actionPlay(_ sender: Any) {
            viewModel.autoPlus()
    }
    @IBOutlet weak var viewTarget: UIView!
    @IBOutlet weak var txtCountValue: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            _ = viewModel.count.asObservable().subscribe({ (count) in
                if let cnt = count.element{
                    if cnt < 1 {
                        self.viewTarget.backgroundColor = UIColor.gray
                    }else if cnt < 2 {
                        self.viewTarget.backgroundColor = UIColor.red
                    }else if cnt < 3 {
                        self.viewTarget.backgroundColor = UIColor.yellow
                    }else {
                        self.viewTarget.backgroundColor = UIColor.green
                    }
                    self.txtCountValue.text = "\(cnt)"
                }
                }).disposed(by: bag)
    }
}
