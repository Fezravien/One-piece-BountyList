//
//  BountyInfo.swift
//  BountyList
//
//  Created by 윤재웅 on 2020/05/27.
//  Copyright © 2020 pazravien. All rights reserved.
//

import UIKit


struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}

