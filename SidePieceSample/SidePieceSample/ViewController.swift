//
//  ViewController.swift
//  SidePieceSample
//
//  Created by Ezekiel Abuhoff on 6/12/17.
//  Copyright © 2017 Ezekiel Abuhoff. All rights reserved.
//

import UIKit
import SidePiece

class ViewController: SidePieceController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let mainButton = UIButton(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        mainButton.backgroundColor = UIColor.red
        mainButton.addTarget(self, action: #selector(buttonPressed(sender:forEvent:)), for: .touchUpInside)
        
        let sideButton = UIButton(frame: CGRect(x: 20, y: 20, width: 50, height: 50))
        sideButton.backgroundColor = UIColor.blue
        sideButton.addTarget(self, action: #selector(buttonPressed(sender:forEvent:)), for: .touchUpInside)
        
        sideView.backgroundColor = UIColor.green
        
        view.addSubview(mainButton)
        sideView.addSubview(sideButton)
    }
    
    internal func buttonPressed(sender: UIButton, forEvent event: UIEvent) {
        toggleSideView()
    }
}
