//
//  ViewController.swift
//  GoogleAnimation
//
//  Created by Abhimanyu  on 04/08/17.
//  Copyright © 2017 Konstant. All rights reserved.
//

import UIKit
import GoogleAnimatorConstrain

class ViewController: UIViewController, AnimatorCardDelegate, AnimatorTableDelegate {

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.view.backgroundColor = .white
        setView()

        //set up navigation bar configuration
        setNav();
    }

    func setNav(){
    
        self.edgesForExtendedLayout = []
        self.navigationController?.isNavigationBarHidden = true;
        
   }
    
    func setNavButton() {
        
        //menu
        let btnMenu  =  UIButton(type: .custom)
        btnMenu.translatesAutoresizingMaskIntoConstraints = false
        btnMenu.backgroundColor = .clear
        btnMenu.addTarget(self, action: #selector(self.btnActionTaped(btn:)), for: UIControl.Event.touchUpInside)
        btnMenu.setImage(UIImage.init(named: "menu"), for: UIControl.State.normal);
        btnMenu.setImage(UIImage.init(named: "back"), for: UIControl.State.selected);
        btnMenu.tag = 1
        self.view.addSubview(btnMenu)
        
        C.set(item: btnMenu, attri: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.08, constant: 0, viewMain: self.view);
        C.set(item: btnMenu, attri: .height, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.08, constant: 0, viewMain: self.view);
        C.set(item: btnMenu, attri: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: gap(), viewMain: self.view);
        C.set(item: btnMenu, attri: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant:  gap()*2.5, viewMain: self.view);
        
        //Search
        let btnSearch  =  UIButton(type: .custom)
        btnSearch.translatesAutoresizingMaskIntoConstraints = false
        btnSearch.backgroundColor = .clear
        btnSearch.addTarget(self, action: #selector(self.btnActionTaped(btn:)), for: UIControl.Event.touchUpInside)
        btnSearch.setImage(UIImage.init(named: "menu"), for: UIControl.State.normal);
        btnSearch.setImage(UIImage.init(named: "back"), for: UIControl.State.selected);
        btnSearch.tag = 1
        self.view.addSubview(btnSearch)
        
        C.set(item: btnSearch, attri: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.08, constant: 0, viewMain: self.view);
        C.set(item: btnSearch, attri: .height, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.08, constant: 0, viewMain: self.view);
        C.set(item: btnSearch, attri: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -gap(), viewMain: self.view);
        C.set(item: btnSearch, attri: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: gap()*2.5, viewMain: self.view);
        
        // Button
        self.view.bringSubview(toFront: btnMenu)
        self.view.bringSubview(toFront: btnSearch)
        
    }
    
    func setView(){

        //1. initialize animator
        let cards = [
            Card.init(bgImage: "0.png", strTitle: "SCIENCE",   items: [ Model(), Model(), Model()] ),
            Card.init(bgImage: "1.png", strTitle: "SPORTS",    items: [ Model(), Model(), Model(), Model(), Model(), Model()] ),
            Card.init(bgImage: "2.png", strTitle: "FRIENDS",   items: [ Model(), Model(), Model(), Model()] ),
            Card.init(bgImage: "3.png", strTitle: "STYLISH",   items: [ Model(), Model() ] )
        ]
        
        Animator.shared.setAnimator(UIImage.init(named: "bg.jpeg"), self.view, AnimationConfig(cards: cards) )
        Animator.shared.delegateTable = self;
        Animator.shared.delegateCard = self;
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- UIButton Actions
    @objc func btnActionTaped(btn:UIButton){
    
    }
    
    
    //MARK:- Animator Delegate Methods 
    func didSelect(item: Model, inCard card: Card) {
        
        print(item.description)
        print(card.description)
        
        let vcDetail = DetailVc()
        vcDetail.titleString = card.strTitle;
        self.navigationController?.pushViewController(vcDetail, animated: true);
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

