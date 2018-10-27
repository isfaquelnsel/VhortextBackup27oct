//
//  ContactTabCell.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class ContactTabCell: UITableViewCell {
    
    
    /*MARK:--------------------------UI Design(start)-----------------------------*/
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactStatus: UILabel!
    @IBOutlet weak var contactBlock: UIButton!
    @IBOutlet weak var contactFavorite: UIButton!
    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var viewOnlineStatus: UIView!
    /*MARK:--------------------------UI Design(end)-----------------------------*/
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*MARK:--------------------------UI Design(start)-----------------------------*/
        //To convert UIImage View to Circle shape
        contactImage.layer.cornerRadius = contactImage.bounds.size.height/2
        contactImage.layer.borderWidth = 0.5
        contactImage.layer.borderColor = UIColor.clear.cgColor
        
        contactImage.image?.addShadow(image: contactImage, color: .darkGray, offSet: CGSize(width: 0, height: 1), opacity: 0.5, radius: 1)
        
        
        //To convert UIView to Circle shape
        viewOnlineStatus.layer.cornerRadius = viewOnlineStatus.bounds.size.height/2
        viewOnlineStatus.layer.borderWidth = 2.0
        viewOnlineStatus.layer.borderColor = UIColor.chat_text_color.cgColor
        viewOnlineStatus.layer.backgroundColor = UIColor.red.cgColor
        
        contactName.textColor = UIColor.chat_text_color
        contactStatus.textColor = UIColor.chat_text_color
        /*MARK:--------------------------UI Design(end)-----------------------------*/
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
