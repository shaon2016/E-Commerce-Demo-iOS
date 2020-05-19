//
//  RatingView.swift
//  ECommerceDemo
//
//  Created by Ashiq on 17/5/20.
//  Copyright © 2020 LastBlade. All rights reserved.
//

import Foundation
import UIKit

class RatingView : UIStackView {
    var starsRating = 0
    var starsEmptyPicName = "simple-star" // change it to your empty star picture name
    var starsFilledPicName = "filled-star" // change it to your filled star picture name
    
    //initWithFrame to init view from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButtons()
    }
    
    //initWithCode to init view from xib or storyboard
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButtons()
    }
    
    private func setupButtons() {
        let starButtons = self.subviews.filter{$0 is UIButton}
        var starTag = 1
        for button in starButtons {
            if let button = button as? UIButton{
                button.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                //                button.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
                
                button.tag = starTag
                starTag = starTag + 1
            }
        }
        setStarsRating(rating : starsRating)
    }
    
    
    
    
    func setStarsRating(rating : Int = 3){
        self.starsRating = rating
        let stackSubViews = self.subviews.filter{$0 is UIButton}
        for subView in stackSubViews {
            if let button = subView as? UIButton{
                if button.tag > starsRating {
                    button.setImage(UIImage(named: starsEmptyPicName), for: .normal)
                }else{
                    button.setImage(UIImage(named: starsFilledPicName), for: .normal)
                }
            }
        }
    }
    
    //    @objc func pressed(sender: UIButton) {
    //        setStarsRating(rating: sender.tag)
    //    }
}
