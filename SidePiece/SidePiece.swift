//
//  SidePiece.swift
//  SidePiece
//
//  Created by Ezekiel Abuhoff on 6/12/17.
//  Copyright © 2017 Ezekiel Abuhoff. All rights reserved.
//

import UIKit

open class SidePieceController : UIViewController {
    // MARK: Public Properties
    public var sideView: UIView = UIView()
    
    // MARK: Private Properties
    private lazy var shadeView: UIView = {
        let newShadeView = UIView()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(shadeViewTapped(sender:forEvent:)))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        newShadeView.addGestureRecognizer(tapRecognizer)
        
        newShadeView.backgroundColor = UIColor.black
        newShadeView.alpha = 0.0
        
        return newShadeView
    }()
    private var sideViewVisible = false
    
    private var superview: UIView {
        if let presentSuperview = view.superview {
            return presentSuperview
        }
        return UIView()
    }
    private var appropriateSideViewHeight: CGFloat {
        return view.frame.size.height
    }
    private var appropriateSideViewWidth: CGFloat {
        return view.frame.size.width * 0.75
    }
    
    // MARK: Public Methods
    public func toggleSideView() {
        if sideViewVisible {
            sideViewVisible = false
            slideAwaySideView()
        } else {
            sideViewVisible = true
            slideInSideView()
        }
    }
    
    // MARK: Private Methods
    private func equipSideView() {
        sideView.frame = CGRect(x: -appropriateSideViewWidth, y: 0.0,
                                width: appropriateSideViewWidth, height: appropriateSideViewHeight)
        superview.addSubview(sideView)
    }
    
    private func unequipSideView() {
        sideView.removeFromSuperview()
    }
    
    private func equipShadeView() {
        shadeView.frame = view.frame
        view.addSubview(shadeView)
    }
    
    private func unequipShadeView() {
        shadeView.removeFromSuperview()
    }
    
    private func slideInSideView() {
        equipSideView()
        equipShadeView()
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .curveEaseOut, animations: {
            self.sideView.frame.origin.x = 0.0
            self.view.frame.origin.x = self.appropriateSideViewWidth
            self.shadeView.alpha = 0.5
        }) { (complete) in
            self.shadeView.isUserInteractionEnabled = true
        }
    }
    
    private func slideAwaySideView() {
        shadeView.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .curveEaseIn, animations: {
            self.sideView.frame.origin.x = -self.appropriateSideViewWidth
            self.view.frame.origin.x = 0.0
            self.shadeView.alpha = 0.0
        }) { (complete) in
            self.unequipSideView()
            self.unequipShadeView()
        }
    }
    
    @objc fileprivate func shadeViewTapped(sender: UIButton, forEvent event: UIEvent) {
        toggleSideView()
    }
}
