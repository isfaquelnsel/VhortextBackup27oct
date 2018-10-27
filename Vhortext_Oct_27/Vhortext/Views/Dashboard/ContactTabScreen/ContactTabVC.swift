//
//  ContactTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class ContactTabVC: UIViewController {
    
    /*MARK:-------------------------------UI Design(start)---------------------------------------*/
    @IBOutlet weak var btnRefresh: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var tblcontactSync: UITableView!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    @IBOutlet weak var lblNoDataAvailable: UILabel!
    
    @IBOutlet weak var viewBGRefresh: UIView!
    var contactTabCell = ContactTabCell()
    
    //Dummy array data
    var arrDict = [["usrUserName": "Md Isfaque", "usrMobile": "9988776655", "usrProfileStatus": "Be the best you" ], ["usrUserName": "Satish", "usrMobile": "0123456789", "usrProfileStatus": "At Movies"], ["usrUserName": "Siddarth", "usrMobile": "99999988888", "usrProfileStatus": "Busy"],["usrUserName": "Siddarth", "usrMobile": "99999988888", "usrProfileStatus": "Busy"],["usrUserName": "Siddarth", "usrMobile": "99999988888", "usrProfileStatus": "Busy"],["usrUserName": "Siddarth", "usrMobile": "99999988888", "usrProfileStatus": "Busy"]]
    
    /*MARK:-----------------------------------UI Design(end)--------------------------------------*/
    
    
    var contactsData = [UserData]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*-----------------------------------UI Design(start)-----------------------------------*/
        
        viewBGRefresh.isHidden = true
        lblNoDataAvailable.isHidden = true
        lblNoDataAvailable.textColor = UIColor.chat_text_color
        
        btnSearch.layer.cornerRadius = btnSearch.bounds.size.height/2
        btnRefresh.layer.cornerRadius = btnSearch.bounds.size.height/2
        
        tblcontactSync.delegate = self
        tblcontactSync.dataSource = self
        tblcontactSync.tableFooterView = UIView()
        tblcontactSync.alwaysBounceVertical = false
        
        activityLoader.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        activityLoader.color = UIColor.black
        activityLoader.isHidden = true
        
        //UIApplication.shared.beginIgnoringInteractionEvents()
        //UIApplication.shared.endIgnoringInteractionEvents()
        
        
        //To change image tint color to white
        let person = UIImage(named: "ic_person_search")
        let personWhite = person?.withRenderingMode(.alwaysTemplate)
        btnSearch.setImage(personWhite, for: .normal)
        btnSearch.tintColor = UIColor.white
        /*-----------------------------------UI Design(end)--------------------------------------*/
        
        contactsData = ContactUserModel.shared.getAllUsers() as! [UserData]
        let totalUserCount:Int = ContactUserModel.shared.getUserCount()
        
        print("Total User Count>>>>>>:\(totalUserCount)")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    //Action of Search people button
    @IBAction func btnPersonSelected(_ sender: Any) {
        
        /*
        let vc = UIStoryboard.init(name: "Search", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
    
    //Action of Refresh Vhortext Contacts button
    @IBAction func btnRefresh(_ sender: Any) {
        
        
    }
    
    
}

/*MARK:- -----------Extension to UITableView Delegate and DataSource functions (start)--------------*/
extension ContactTabVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1  
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsData.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        let vc = UIStoryboard.init(name: "PrivateChat", bundle: Bundle.main).instantiateViewController(withIdentifier: "PrivateChatVC") as? PrivateChatVC
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        contactTabCell = tableView.dequeueReusableCell(withIdentifier: "ContactTabCell") as! ContactTabCell
        contactTabCell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let data = contactsData[indexPath.row]
        
        contactTabCell.contactName.text = data.usrUserName
        contactTabCell.contactStatus.text = data.usrProfileStatus
        
        return contactTabCell
    }
    
    
}
