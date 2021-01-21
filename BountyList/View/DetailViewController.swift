//
//  DetailViewController.swift
//  BountyList
//
//  Created by 윤재웅 on 2020/05/20.
//  Copyright © 2020 pazravien. All rights reserved.
//

// MVVM

// Model
// - BountyInfo
// > BountyInfo 만들자

// View
// - imgView, nameView, bountylabel
// > View들은 ViewModel를 통해서 구성되기

// ViewMoodel
// - DetailViewModel
// > 뷰레이어에서 필요한 메서드 만들기
// > 모델 가지고 있기,, BountyInfo 들

import UIKit
import NumberScrollAnimatedView

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    @IBOutlet weak var bountyLableCenterX: NSLayoutConstraint!
    @IBOutlet weak var nameLablelCenterX: NSLayoutConstraint!
    
    var animatedView: NumberScrollAnimatedView!
    
    @IBAction func close(_ sender: Any) {
            dismiss(animated: true, completion: nil)
        }
    
    // ViewModel을 통한 데이터 객체 생성
    let viewModel = DetailViewModel()
    
    
    // MARK: - View 라이프사이클
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatedView = NumberScrollAnimatedView()
        
        updateUI()
        prepareAnimation()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    
    // MARK: - Animation
    private func prepareAnimation(){
        
        
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
//        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        animatedView.frame = CGRect(x: self.bountyLabel.frame.origin.x-20 , y: self.bountyLabel.frame.origin.y-25, width: 200, height: 40)
        animatedView.font = UIFont.boldSystemFont(ofSize: 38)
        animatedView.textColor = .lightGray
        animatedView.animationDuration = 3
        animatedView.scrollingDirectionRule = { (_, columnIndex) in return (columnIndex % 2) == 0 ? .down : .up }
        animatedView.text = bountyLabel.text!
        self.view.addSubview(animatedView)
        
        nameLabel.alpha = 0
//        bountyLabel.alpha = 0
    }
    
    private func showAnimation(){
        

        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
                self.nameLabel.transform = CGAffineTransform.identity
                self.nameLabel.alpha = 1
        }, completion: nil)
        
//        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
//                self.bountyLabel.transform = CGAffineTransform.identity
//                self.bountyLabel.alpha = 1
//        }, completion: nil)
        
        animatedView.startAnimation()
        
        
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    
    // MARK: - UI update
    func updateUI(){
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    
}


