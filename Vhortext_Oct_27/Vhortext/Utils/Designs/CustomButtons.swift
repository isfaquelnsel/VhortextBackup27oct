//
//  CustomButtons.swift
//  Vhortext
//
//  Created by LNSEL on 05/10/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation
import UIKit

/*MARK:- -----------------Button heightlighted color when tap that button (start)-----------------*/
class CustomButtons: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            if (isHighlighted) {
                
                backgroundColor = UIColor(red: 76/255, green: 57/255, blue: 52/255, alpha: 1)
                
            } else {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.backgroundColor = .clear
                    
                }
                
            }
        }
    }
    
}
/*MARK:- -----------------Button heightlighted color when tap that button (end)--------------------*/



/*MARK:- -----Button Extension to Set the Button Image and Title in certain position (start)-------*/
extension UIButton{
    
    
    func buttonDropShadow(color: UIColor, opacity: Float, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
    }
    
    func attachmentImageAndTextAlignment(spacing: CGFloat){
        if let image = self.imageView?.image {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsetsMake(spacing, -imageSize.width, -(imageSize.height), 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedStringKey.font: self.titleLabel!.font])
            
            self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height), 0.0, 0.0, -titleSize.width)
            
        }
    }
    
}

/*MARK:- ------Button Extension to Set the Button Image and Title in certain position (end)---------*/
