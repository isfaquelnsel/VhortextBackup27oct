//
//  CommonMethod.swift
//  Vhortext
//
//  Created by LNSEL on 26/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import Foundation
import UIKit


class CommonMethods{
    
    
    
    
    
    
}

/*MARK:- ------------------------------Declaration of Color codes----------------------------------*/
extension UIColor {
    
    class var view_yellow: UIColor{return self.init(red: 240/255, green: 189/255, blue:121/255, alpha: 1.0)}
    class var underline_green: UIColor{return self.init(red: 85/255, green: 193/255, blue: 184/255, alpha: 1.0)}
    class var orange: UIColor{return self.init(red: 250/255, green: 168/255, blue: 36/255, alpha: 1.0)}
    class var gray: UIColor{return self.init(red:198/255, green: 191/255, blue: 191/255, alpha: 1.0)}
    class var chat_text_color: UIColor{return self.init(red: 87/255, green: 44/255, blue: 1/255, alpha: 1.0)}
    class var  chat_swipe_left_section_color: UIColor{return self.init(red: 230/255, green: 184/255, blue: 0/255, alpha: 1.0)}
    class var  chat_swipe_right_section_color: UIColor{return self.init(red: 213/255, green: 93/255, blue: 93/255, alpha: 1.0)}
    class var  row_selection_color: UIColor{return self.init(red: 226/255, green: 221/255, blue: 218/255, alpha: 1.0)}
    class var  shadow_color: UIColor{return self.init(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.0)}
    

}


//MARK:- ------------------------To change the status bar backgroung color----------------------
extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}

