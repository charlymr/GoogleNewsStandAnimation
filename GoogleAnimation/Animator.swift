//
//  Main.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit

public protocol AnimatorCardDelegate{

    func  cardClickedFromTopHeader(card:Card)

}

public extension AnimatorCardDelegate {
    
    func cardClickedFromTopHeader(card:Card) {
        
        /// This code block will animate selected card to mid way while full_stage
        if Animator.shared.config.headerStage == Stage.full_stage {
            let selectedGestureRecongnser = SwipeGesture()
            /// Set selected index
            Animator.shared.config.selectedIndex = card.tag
            /// Set bottom view content offset
            let x =  CGFloat(Animator.shared.config.selectedIndex!)*Animator.shared.topView!.bounds.size.width
            Animator.shared.bottomView.tblHolder.setContentOffset(CGPoint.init(x:x,y: 0), animated: false);
            /// Set Selected card position
            selectedGestureRecongnser.setSelectedCardIndex()
            
            /// Swipe up manually
            selectedGestureRecongnser.direction = .up
            selectedGestureRecongnser.handleSwipe(gesture: selectedGestureRecongnser)
            
        }

    }

}

public protocol AnimatorTableDelegate {
    func  didSelect(item:Model,inCard card:Card)
}

public class Animator: NSObject{
    
    public var delegateCard: AnimatorCardDelegate! = nil
    
    public var delegateTable: AnimatorTableDelegate! = nil
    
    lazy var config: AnimationConfig = AnimationConfig(cards: [])
    
    static public var shared: Animator = Animator()
    
    var imgViewBg: UIImageView! = UIImageView()
   
    var topView: TopView!
    
    var bottomView: BottomView!

    var viewMain:UIView!

    public func setAnimator(_ backgroundImage: UIImage? = UIImage(), _ v: UIView? = UIView(), _ config: AnimationConfig) {
        self.config = config
 
        viewMain = v;
    
        imgViewBg.image = backgroundImage
        imgViewBg.isUserInteractionEnabled = true
        imgViewBg.backgroundColor = .red;
        imgViewBg.translatesAutoresizingMaskIntoConstraints = false
        
        v!.addSubview(imgViewBg);
    
        
        C.set(item: imgViewBg, attri: .width, relatedBy: .equal, toItem: v!, attribute: .width, multiplier: 1.0, constant: 0, viewMain: v!);
        C.set(item: imgViewBg, attri: .height, relatedBy: .equal, toItem: v!, attribute: .height, multiplier: 1.0, constant: 0, viewMain: v!);
        C.set(item: imgViewBg, attri: .centerX, relatedBy: .equal, toItem: v!, attribute: .centerX, multiplier: 1.0, constant: 0, viewMain: v!);
        C.set(item: imgViewBg, attri: .centerY, relatedBy: .equal, toItem: v!, attribute: .centerY, multiplier: 1.0, constant:0, viewMain:v!);
        
        imgViewBg.layoutIfNeeded()
        
        topView = TopView.init(v: imgViewBg);

        //add swiper with directions .....
        Swip.shared.madeSwiperWithDirections(config: SwiperConfig(), view: imgViewBg);
  
    }
    
    func cardSelected(card: Card)
    {
    
        if self.delegateCard != nil
        {
            self.delegateCard.cardClickedFromTopHeader(card: card);
        }
    }
    
    func tableItem(item: Model, card: Card)
    {
        if self.delegateTable != nil
        {
            self.delegateTable.didSelect(item: item, inCard: card);
        }
    }
    
//   static func destroy(){
//    
//    if self.shared != nil{
//        self.shared = nil
//    }
//    }
//    
    
}

