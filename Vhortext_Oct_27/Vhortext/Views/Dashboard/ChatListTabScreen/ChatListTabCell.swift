//
//  ChatListTabCell.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class ChatListTabCell: UITableViewCell {
    
    @IBOutlet weak var imgFriend: UIImageView!
    @IBOutlet weak var lblFriendName: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    @IBOutlet weak var imgFavorite: UIImageView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var viewOnlineStatus: UIView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //MARK:- -------------------------------To change Image View to Circle shape-----------------------------------
        imgFriend.layer.cornerRadius = imgFriend.bounds.size.height/2
        imgFriend.layer.borderWidth = 0.5
        imgFriend.layer.borderColor = UIColor.darkGray.cgColor
        
        imgFriend.image?.addShadow(image: imgFriend, color: .lightGray, offSet: CGSize(width: 1, height: 3), opacity: 0.5, radius: 2)
        
        
        //MARK:- ----------------------------------To change UIView to Circle shape-----------------------------------
        viewOnlineStatus.layer.cornerRadius = viewOnlineStatus.bounds.size.height/2
        viewOnlineStatus.layer.borderWidth = 2.0
        viewOnlineStatus.layer.borderColor = UIColor.chat_text_color.cgColor
        viewOnlineStatus.backgroundColor = .red
        
        lblFriendName.textColor = UIColor.chat_text_color
        lblMessage.textColor = UIColor.chat_text_color
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
}
