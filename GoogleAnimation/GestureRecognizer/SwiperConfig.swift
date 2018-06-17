//
//  SwiperConfig.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import Foundation
import UIKit
public struct SwiperConfig {
    
    var directions:[UISwipeGestureRecognizer.Direction]!
    
    init(directions:[UISwipeGestureRecognizer.Direction]? =  [UISwipeGestureRecognizer.Direction.up,UISwipeGestureRecognizer.Direction.left,UISwipeGestureRecognizer.Direction.down,UISwipeGestureRecognizer.Direction.right]) {
        self.directions = directions;
    }

}
