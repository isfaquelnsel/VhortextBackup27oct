//
//  InviteContactVC.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class InviteContactsVC: UIViewController, UISearchBarDelegate {
    
    /*MARK:-----------------------------------UI Design(start)--------------------------------*/
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblSelectedRowCount: UILabel!
    @IBOutlet weak var tblIviteContacts: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    /*MARK:-----------------------------------UI Design(end)----------------------------------*/
    
    var inviteContactsCell = InviteContactsCell()
    var selectedRow = [Int]()
    
    //Dummy data for Invite friends tableview
    var arrDict = [["usrUserName": "Md Isfaque", "usrMobile": "9988776655"], ["usrUserName": "Satish", "usrMobile": "0123456789"], ["usrUserName": "Siddarth", "usrMobile": "99999988888"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*MARK:-------------------------------UI Design(start)----------------------------------*/
        searchBar.delegate = self
        tblIviteContacts.delegate = self
        tblIviteContacts.dataSource = self
        tblIviteContacts.tableFooterView = UIView()
        tblIviteContacts.alwaysBounceVertical = false
        
        btnBack.layer.cornerRadius = btnBack.bounds.size.height/2
        btnSkip.layer.cornerRadius = 5.0
        
        activityLoader.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        activityLoader.color = UIColor.black
        activityLoader.isHidden = true
        
        //UIApplication.shared.beginIgnoringInteractionEvents()
        //UIApplication.shared.endIgnoringInteractionEvents()
        
        /*MARK:-----------------------------------UI Design(end)------------------------------*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
    //Back button action
    @IBAction func btnBackAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    //Done button action
    @IBAction func btnDoneAction(_ sender: Any) {
        
        
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    //Skip button action
    @IBAction func btnSkipAction(_ sender: Any) {
        
        
        let vc = UIStoryboard.init(name: "DashboardTabManager", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardTabManagerVC") as? DashboardTabManagerVC
        
        UserDefaults.standard.set("UserLogIn", forKey: "UserAccessToken")
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
    
    
}


/*MARK:- -----------------UITableView Delegate and DataSource Functions (start)--------------------*/
extension InviteContactsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! InviteContactsCell
        
        print("cell--> \(cell)")
        
        cell.imgSelectedStatus.image = UIImage(named: "invite_selected_icon")
        
        if let list = tableView.indexPathsForSelectedRows as? [NSIndexPath] {
            print(list.count)
            
            self.lblSelectedRowCount.text = String(list.count) + " " + "selected"
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! InviteContactsCell
        
        cell.imgSelectedStatus.image = UIImage(named: "invite_deselected_icon")
        
        if let list = tableView.indexPathsForSelectedRows as? [NSIndexPath] {
            print(list.count)
            
            self.lblSelectedRowCount.text = String(list.count) + "selected"
        }else{
            self.lblSelectedRowCount.text = "0 selected"
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        inviteContactsCell = tableView.dequeueReusableCell(withIdentifier: "InviteContactsCell") as! InviteContactsCell
        inviteContactsCell.selectionStyle = UITableViewCellSelectionStyle.none
        
        let data = arrDict[indexPath.row]
        
        inviteContactsCell.lblContactName.text = data["usrUserName"]
        inviteContactsCell.lblContactNumber.text = data["usrMobile"]
        
        return inviteContactsCell
    }
}
