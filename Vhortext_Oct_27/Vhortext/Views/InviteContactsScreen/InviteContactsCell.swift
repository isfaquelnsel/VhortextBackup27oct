//
//  InviteContactsCell.swift
//  Vhortext
//
//  Created by MacBook Pro on 26/10/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class InviteContactsCell: UITableViewCell {
    
    /*MARK:--------------------------UI Design(start)-----------------------------*/
    @IBOutlet weak var imgContact: UIImageView!
    @IBOutlet weak var lblContactName: UILabel!
    @IBOutlet weak var lblContactNumber: UILabel!
    @IBOutlet weak var imgSelectedStatus: UIImageView!
    /*MARK:--------------------------UI Design(end)-----------------------------*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*MARK:--------------------------UI Design(start)-----------------------------*/
        //To convert imageView to Circular shape
        imgContact.layer.cornerRadius = imgContact.bounds.size.height/2
        imgContact.layer.borderWidth = 0.5
        imgContact.layer.borderColor = UIColor.darkGray.cgColor
        
        imgContact.image?.addShadow(image: imgContact, color: .darkGray, offSet: CGSize(width: 0, height: 1), opacity: 0.5, radius: 1)
        /*MARK:--------------------------UI Design(end)-----------------------------*/
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
