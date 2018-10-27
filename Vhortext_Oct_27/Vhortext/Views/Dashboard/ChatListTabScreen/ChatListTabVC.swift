//
//  ChatListTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class ChatListTabVC: UIViewController {
    
    //MARK:- ----------------------------------------Oulets of UIComponents---------------------------------------
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var tblChatingList: UITableView!
    @IBOutlet weak var bgViewMoreOptions: UIView!
    @IBOutlet weak var viewMoreOptions: UIView!
    @IBOutlet weak var btnClearConversation: UIButton!
    @IBOutlet weak var btnEmailConversation: UIButton!
    @IBOutlet weak var btnBlock: UIButton!
    @IBOutlet weak var viewInviteFriendsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnInviteFriendsHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblInviteFriendsHeightConstraint: NSLayoutConstraint!
    
    
    var chatListTabCell = ChatListTabCell()
    
    //MARK:- --------------------------------------Variables for dummy data--------------------------------------
    var chatListNames = ["hari","satish"]
    var chatListMessage = ["good morning","Hi"]
    
    
    
    //MARK:- -----------------------------------------Life Cycle (start)-----------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewMoreOptions.isHidden = true
        bgViewMoreOptions.isHidden = true
        
        tblChatingList.delegate = self
        tblChatingList.dataSource = self
        tblChatingList.tableFooterView = UIView()
        tblChatingList.alwaysBounceVertical = false
        
        btnClearConversation.contentHorizontalAlignment = .left
        btnEmailConversation.contentHorizontalAlignment = .left
        btnBlock.contentHorizontalAlignment = .left
        
        //To add bottom line of the button---------------------------------------
        btnClearConversation.addBottomBorder(color: UIColor.darkGray, height: 1.0)
        btnEmailConversation.addBottomBorder(color: UIColor.darkGray, height: 1.0)
        
        //MARK:- ------------------------To change the Image tint color to white---------------------------------
        let person = UIImage(named: "ic_person_search")
        let personWhite = person?.withRenderingMode(.alwaysTemplate)
        btnSearch.setImage(personWhite, for: .normal)
        btnSearch.tintColor = UIColor.white
        
        btnSearch.layer.cornerRadius = btnSearch.bounds.size.height/2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.isNavigationBarHidden = true
        viewInviteFriendsHeightConstraint.constant = 50
        btnInviteFriendsHeightConstraint.constant = 40
        lblInviteFriendsHeightConstraint.constant = 21
        
    }
    //MARK:- ----------------------------------Life Cycle (end)------------------------------------
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.bgViewMoreOptions.endEditing(true)
        bgViewMoreOptions.isHidden = true
    }
    
    
    
    
    //MARK:- -----------------------------Select person button action-----------------------------
    @IBAction func btnPersonSelected(_ sender: Any) {
        
        /*
        let vc = UIStoryboard.init(name: "Search", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
    
    //MARK:- -----------------------------Invite Friend button action------------------------------
    @IBAction func btnInviteFriends(_ sender: Any) {
        
        /*
        let vc = UIStoryboard.init(name: "InviteFriends", bundle: Bundle.main).instantiateViewController(withIdentifier: "InviteFriendsVC") as! InviteFriendsVC
        
        self.navigationController?.pushViewController(vc, animated: true)*/
        
    }
    
    
    //MARK:- ----------------------------------Back button action-----------------------------------
    @IBAction func btnCancleAction(_ sender: Any) {
        
        viewInviteFriendsHeightConstraint.constant = 0
        btnInviteFriendsHeightConstraint.constant = 0
        lblInviteFriendsHeightConstraint.constant = 0
        
    }
    
    
    //MARK:- ----------------------------Clear Conversation button action-------------------------
    @IBAction func btnClearConversationAction(_ sender: Any) {
        
        viewMoreOptions.isHidden = true
        bgViewMoreOptions.isHidden = true
        
        
    }
    
    
    //MARK:- ------------------------Clear Email Conversation button action-----------------------
    @IBAction func btnClearEmailConversation(_ sender: Any) {
        
        viewMoreOptions.isHidden = true
        bgViewMoreOptions.isHidden = true
        
        
    }
    
    
    //MARK:- --------------------------------Back button action----------------------------------
    @IBAction func btnBlockAction(_ sender: Any) {
        
        viewMoreOptions.isHidden = true
        bgViewMoreOptions.isHidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}


//MARK:- ------------------UITableView Delegate and DataSource functions (start)-------------------
extension ChatListTabVC: UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
}


extension ChatListTabVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatListNames.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        chatListTabCell = tableView.dequeueReusableCell(withIdentifier: "ChatListTabCell") as! ChatListTabCell
        chatListTabCell.selectionStyle = UITableViewCellSelectionStyle.none
        
        chatListTabCell.lblFriendName.text = chatListNames[indexPath.row]
        chatListTabCell.lblMessage.text = chatListMessage[indexPath.row]
        
        return chatListTabCell
        
    }
    
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let moreAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            success(true)
            
            self.viewMoreOptions.isHidden = false
            self.bgViewMoreOptions.isHidden = false
        })
        moreAction.image = UIImage(named: "ic_chatlist_more")
        moreAction.backgroundColor = UIColor.chat_swipe_left_section_color
        
        return UISwipeActionsConfiguration(actions: [moreAction])
        
    }
    
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let deleteAction = UIContextualAction(style: .normal, title:  "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            success(true)
            
            let alert = UIAlertController(title: "", message: "Do you want to delete ?", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Delete", style: UIAlertActionStyle.default, handler: { action in
                
                
                
                
            }))
            
            self.present(alert, animated: true, completion: nil)
            
        })
        
        deleteAction.image = UIImage(named: "delete_icon")
        deleteAction.backgroundColor = UIColor.chat_swipe_right_section_color
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}
