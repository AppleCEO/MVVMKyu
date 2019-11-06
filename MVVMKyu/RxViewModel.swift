//
//  RxModelView.swift
//  MVVMKyu
//
//  Created by joon-ho kil on 2019/11/06.
//  Copyright © 2019 joon-ho kil. All rights reserved.
//

import Foundation
import RxSwift

class RxViewModel {
    var count = Variable<Int>(0)
    var model = Model()
    
    func autoPlus(){
       DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
       let cnt = self.count.value
       if cnt < 3{
         print("count = \(cnt)")
         self.count.value = self.model.AddCount(value: cnt)
         self.autoPlus()
        }else{
         self.count.value = 0
        }
      }
    }
}
