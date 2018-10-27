//
//  GroupTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class GroupTabVC: UIViewController {
    
    /*MARK:----------------------------------------UI Design(start)----------------------------*/
    @IBOutlet weak var tblViewGroupChating: UITableView!
    @IBOutlet weak var btnSearchGroup: UIButton!
    @IBOutlet weak var btnCreateGroup: UIButton!
    
    var groupCell = GroupTabCell()
    
    //Dummy data for group list table
    var arrDict = [["usrUserName": "Md Isfaque", "lastMessage": "Hello", "category": "Admin", "msgTime": "9:38AM"], ["usrUserName": "Satish", "lastMessage": "How are you", "category": "Admin", "msgTime": "9:24AM"], ["usrUserName": "Siddarth", "lastMessage": "fine", "category": "Admin", "msgTime": "8:318AM"]]
    /*MARK:----------------------------------------UI Design(end)----------------------------*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*MARK:----------------------------------------UI Design(start)----------------------------*/
        btnSearchGroup.layer.cornerRadius = btnSearchGroup.bounds.size.height/2
        btnCreateGroup.layer.cornerRadius = btnCreateGroup.bounds.size.height/2
        
        tblViewGroupChating.delegate = self
        tblViewGroupChating.dataSource = self
        
        tblViewGroupChating.tableFooterView = UIView()
        tblViewGroupChating.alwaysBounceVertical = false
        
        let groupCreate = UIImage(named: "ic_group_create")
        let groupCreateWhite = groupCreate?.withRenderingMode(.alwaysTemplate)
        btnCreateGroup.setImage(groupCreateWhite, for: .normal)
        btnCreateGroup.tintColor = UIColor.white
        
        let groupSearch = UIImage(named: "ic_group_search")
        let groupSearchWhite = groupSearch?.withRenderingMode(.alwaysTemplate)
        btnSearchGroup.setImage(groupSearchWhite, for: .normal)
        btnSearchGroup.tintColor = UIColor.white
        /*MARK:----------------------------------------UI Design(end)----------------------------*/
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    //Create Group Button action
    @IBAction func btnCreateGroup(_ sender: Any) {
        
        
    }
    
    
    
    
}


/*MARK:--------------UITableView Delegate and DataSource Functions (start)--------------------*/
extension GroupTabVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}


extension GroupTabVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrDict.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        groupCell = tableView.dequeueReusableCell(withIdentifier: "GroupTabCell") as! GroupTabCell
        
        let data = arrDict[indexPath.row]
        
        groupCell.lblGroupName.text = data["usrUserName"]
        groupCell.lblGroupAdmin.text = data["category"]
        groupCell.lblGroupMessage.text = data["lastMessage"]
        groupCell.lblMessageTime.text = data["msgTime"]
        
        return groupCell
        
    }
}


