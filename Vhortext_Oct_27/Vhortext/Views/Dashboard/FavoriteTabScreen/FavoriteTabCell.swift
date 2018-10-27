//
//  FavoriteTabCell.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class FavoriteTabCell: UITableViewCell {
    
    /*MARK:--------------------------UI Design(start----------------------------*/
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var favoriteFriendName: UILabel!
    @IBOutlet weak var favoriteMessage: UILabel!
    /*MARK:--------------------------UI Design(end)-----------------------------*/
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
