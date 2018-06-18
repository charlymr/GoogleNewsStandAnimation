//
//  AnimationConfig.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit

public func SCREEN_WIDTH() -> CGFloat {
    guard let mainWindow =  UIApplication.shared.delegate?.window as? UIWindow else { return 1 }
    return mainWindow.bounds.size.width
}

public func  SCREEN_HEIGHT() -> CGFloat {
    guard let mainWindow =  UIApplication.shared.delegate?.window as? UIWindow else { return 1 }
    return mainWindow.bounds.size.height
}

public var require_SafeArea: Bool {
    guard let mainWindow =  UIApplication.shared.delegate?.window as? UIWindow else {
        return false
    }
    return mainWindow.safeAreaInsets.top  > 0.0
}

enum Stage:Int {
   case header_stage = 0,
    mid_stage,
    full_stage
}

public struct AnimationConfig{

    var selectedIndex:Int? = 0
    var animationaccerlation:CGFloat! = 40.0
    var animationTopBottomValue:CGFloat! = 0.0
    var animationleftRightValue:CGFloat! = 0.0

    var top_Header_h:CGFloat?   =  require_SafeArea ? SCREEN_WIDTH()*0.235 : SCREEN_WIDTH()*0.17
    
    var mid_Header_h:CGFloat?   = SCREEN_HEIGHT()*0.40
    
    var full_Header_h:CGFloat?  = SCREEN_HEIGHT()
    
    var headerH:CGFloat?        =  SCREEN_HEIGHT()*0.40
    
    var animation_speed:Float?   = 0.5
    
    var topHeaderHeightConstraint:NSLayoutConstraint?

    //card related
    var line_height:CGFloat?    = SCREEN_WIDTH()*0.01
    var line_width:CGFloat?     = SCREEN_WIDTH()*0.11
    
    var headerStage:Stage?  = Stage.init(rawValue:1)
    
    lazy  var cards:[Card]? = [Card]()

    lazy  var lineBgSelectedColor:UIColor?  = .white
    
    lazy  var lineBgNormalColor:UIColor?    = .gray
    
    public init(
          cards:[Card]? = [Card.init(bgImage: "0.png", strTitle: "SCIENCE", items: [ Model(), Model(), Model()]),
                           
                           Card.init(bgImage: "1.png", strTitle: "SPORTS", items: [ Model(), Model(), Model(), Model(), Model(), Model()]),
                           
                           Card.init(bgImage: "2.png", strTitle: "FRIENDS", items: [ Model(), Model(), Model(), Model()]),
                           
                           Card.init(bgImage: "3.png", strTitle: "STYLISH", items: [ Model(), Model()] )

                            ])
    {
        
        self.headerH = self.mid_Header_h
        self.cards = cards
        
       
    }
    
    
}
