//
//  DashboardTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class DashboardTabManagerVC: UITabBarController,UINavigationControllerDelegate, UITabBarControllerDelegate {
    
    @IBOutlet weak var selectionBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*MARK:-------------------------UI Design(start)----------------------------*/
        selectionBar.dropShadow(color: .shadow_color, opacity: 0.5, offSet: CGSize(width: 0, height: 0.5), radius: 6)
        UITabBar.appearance().backgroundColor = UIColor.white
        
        //   UITabBar.appearance().selectionIndicatorImage = UIImage(named: "ic_tab_black_bubble")?.makeImageWithColorAndSize(color: UIColor.black, size: CGSize(width: 40, height: 40)).resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0 , right: 0))
        
        
        if UIScreen.main.bounds.size.height == 812 {
            
            //// UITabBar.appearance().selectionIndicatorImage = UIImage(named: "ic_tab_black_bubble")?.resizableImage(withCapInsets: UIEdgeInsets.init(top: .leastNonzeroMagnitude, left: 0, bottom: 0 , right: 0), resizingMode: UIImageResizingMode.stretch)
            
        } else {
            UITabBar.appearance().selectionIndicatorImage = UIImage(named: "ic_tab_black_bubble")
        }
        
        
        //        for item in (self.selectionBar.items)! {
        //            if let image = item.image {
        //                item.image = image.withRenderingMode(.alwaysOriginal)
        //            }
        //        }
        
        /*MARK:-------------------------UI Design(start)----------------------------*/
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}


extension UIImage {
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
