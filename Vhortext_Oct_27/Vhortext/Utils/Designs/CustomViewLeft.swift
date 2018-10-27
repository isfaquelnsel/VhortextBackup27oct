//
//  CustomViewLeft.swift
//  Vhortext
//
//  Created by LNSEL on 05/10/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation
import UIKit



/*MARK:- -----------To convert UIView to Right angle triangle for left chat bubble (start)--------*/
class CustomViewLeft: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        context.closePath()
        
        context.setFillColor(UIColor.white.cgColor)
        context.fillPath()
    }
    
}
/*MARK:- -----------To convert UIView to Right angle triangle for left chat bubble (end)---------*/

