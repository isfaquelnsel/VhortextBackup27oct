//
//  GroupTabCell.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class GroupTabCell: UITableViewCell {
    
    /*MARK:----------------------------------------UI Design(start)----------------------------*/
    @IBOutlet weak var imgGroup: UIImageView!
    @IBOutlet weak var lblGroupName: UILabel!
    @IBOutlet weak var lblGroupAdmin: UILabel!
    @IBOutlet weak var lblGroupMessage: UILabel!
    @IBOutlet weak var lblMessageTime: UILabel!
    @IBOutlet weak var viewCircle: UIView!
    /*MARK:----------------------------------------UI Design(end)----------------------------*/
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*MARK:--------------------------------UI Design(start)----------------------------*/
        //To convert imageView to circular shape
        imgGroup.layer.cornerRadius = imgGroup.bounds.size.height/2
        imgGroup.layer.borderWidth = 0.5
        imgGroup.clipsToBounds = true
        imgGroup.layer.masksToBounds = true
        imgGroup.layer.borderColor = UIColor.darkGray.cgColor
        
        imgGroup.image?.addShadow(image: imgGroup, color: .darkGray, offSet: CGSize(width: 0, height: 1), opacity: 0.5, radius: 1)
        
        lblGroupName.textColor = UIColor.chat_text_color
        lblGroupAdmin.textColor = UIColor.chat_text_color
        lblGroupMessage.textColor = UIColor.chat_text_color
        /*MARK:-------------------------------UI Design(end)----------------------------*/
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
