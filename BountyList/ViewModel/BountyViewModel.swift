//
//  BountyViewModel.swift
//  BountyList
//
//  Created by 윤재웅 on 2020/08/09.
//  Copyright © 2020 pazravien. All rights reserved.
//

import UIKit

class BountyViewModel{
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44000000),
        BountyInfo(name: "luffy", bounty: 600000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 300000000)
    ]
    
    var sortedList: [BountyInfo]{
       let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    var numOfBountyInfoList: Int{
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo{
       return sortedList[index]
    }
}
