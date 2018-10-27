//
//  CustomImage.swift
//  Vhortext
//
//  Created by LNSEL on 05/10/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation
import UIKit


class CustomImages{
    
    
}

/*MARK:- ------------------To add shadow to circular shape ImageViews (start)--------------------*/
extension UIImage {
    
    func addShadow(image: UIImageView, color: UIColor, offSet: CGSize, opacity: Float, radius: CGFloat) {
        
        image.layer.cornerRadius = 30
        image.layer.masksToBounds = true
        image.clipsToBounds = true

        image.backgroundColor = UIColor.clear
        image.layer.shadowColor = color.cgColor
        image.layer.shadowOffset = offSet
        image.layer.shadowOpacity = opacity
        image.layer.shadowRadius = radius
        image.layer.shadowPath = UIBezierPath(roundedRect: image.bounds, cornerRadius: radius).cgPath
        
    }
}
/*MARK:- --------------------To add shadow to circular shape ImageViews (end)----------------------*/
