//
//  DetailViewModel.swift
//  BountyList
//
//  Created by 윤재웅 on 2020/08/09.
//  Copyright © 2020 pazravien. All rights reserved.
//

import UIKit

class DetailViewModel {
    
    // Model 에서 가져오기
    // View는 Model을 몰라야함
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?){
            bountyInfo = model
    }
}
