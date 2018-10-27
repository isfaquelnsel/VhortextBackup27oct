//
//  MoreTabVC.swift
//  Vhortext
//
//  Created by LNSEL on 13/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit

class MoreTabVC: UIViewController {
    
    /*MARK:- -------------------------------UI Design(start)-----------------------------*/
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var viewCircleInvite: UIView!
    @IBOutlet weak var viewCircleVideo: UIView!
    @IBOutlet weak var viewCircleBlockUser: UIView!
    @IBOutlet weak var viewCircleUpdateStatus: UIView!
    @IBOutlet weak var viewCircleDelete: UIView!
    @IBOutlet weak var viewCircleSettings: UIView!
    /*MARK:- -------------------------------UI Design(end)-------------------------------*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*MARK:--------------------------------UI Design start)-------------------------*/
        let newChat = UIImage(named: "ic_person_search")
        let newChatWhite = newChat?.withRenderingMode(.alwaysTemplate)
        btnSearch.setImage(newChatWhite, for: .normal)
        btnSearch.tintColor = UIColor.white
        
        btnSearch.layer.cornerRadius = btnSearch.bounds.size.height/2
        viewShapes()
        /*MARK:---------------------------------UI Design(end)---------------------------*/
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    /*MARK:---------------------------------------UI Design(start)-----------------------------*/
    func viewShapes() {
        
        viewCircleInvite.layer.cornerRadius = viewCircleInvite.bounds.size.height/2
        viewCircleInvite.layer.borderColor = UIColor.lightGray.cgColor
        viewCircleInvite.dropShadow(color: .lightGray, opacity: 0.5, offSet: .zero, radius: 2)
        
        viewCircleVideo.layer.cornerRadius = viewCircleVideo.bounds.size.height/2
        viewCircleVideo.layer.borderColor = UIColor.lightGray.cgColor
        viewCircleVideo.dropShadow(color: .lightGray, opacity: 0.5, offSet: .zero, radius: 2)
        
        viewCircleBlockUser.layer.cornerRadius = viewCircleBlockUser.bounds.size.height/2
        viewCircleBlockUser.layer.borderColor = UIColor.lightGray.cgColor
        viewCircleBlockUser.dropShadow(color: .lightGray, opacity: 0.5, offSet: .zero, radius: 2)
        
        viewCircleUpdateStatus.layer.cornerRadius = viewCircleUpdateStatus.bounds.size.height/2
        viewCircleUpdateStatus.layer.borderColor = UIColor.lightGray.cgColor
        viewCircleUpdateStatus.dropShadow(color: .lightGray, opacity: 0.5, offSet: .zero, radius: 2)
        
        
        viewCircleDelete.layer.cornerRadius = viewCircleDelete.bounds.size.height/2
        viewCircleDelete.layer.borderColor = UIColor.lightGray.cgColor
        viewCircleDelete.dropShadow(color: .lightGray, opacity: 0.5, offSet: .zero, radius: 2)
        
        viewCircleSettings.layer.cornerRadius = viewCircleSettings.bounds.size.height/2
        viewCircleSettings.layer.borderColor = UIColor.lightGray.cgColor
        viewCircleSettings.dropShadow(color: .lightGray, opacity: 0.5, offSet: .zero, radius: 2)
        
    }
    /*MARK:---------------------------------------UI Design(end)-----------------------------*/
    
    
    
    //Action of Seach Vhortext Users button
    @IBAction func btnSearchPeople(_ sender: Any) {
        /*
        let vc = UIStoryboard.init(name: "Search", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchVC") as? SearchVC
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
    
    //Action of Invite Vhortext Users button
    @IBAction func btnInviteFriendsAction(_ sender: Any) {
        /*
        let vc = UIStoryboard.init(name: "InviteFriends", bundle: Bundle.main).instantiateViewController(withIdentifier: "InviteFriendsVC") as? InviteFriendsVC
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
    
    //Action of Edit profile button
    @IBAction func btnHowToVideoAction(_ sender: Any) {
        /*
        let vc = UIStoryboard.init(name: "EditProfile", bundle: Bundle.main).instantiateViewController(withIdentifier: "EditProfileVC") as? EditProfileVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
    
    //Action of View Block Users button
    @IBAction func btnViewBlockUsersAction(_ sender: Any) {
        /*
        let vc = UIStoryboard.init(name: "ViewBlockUser", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewBlockUserVC") as? ViewBlockUserVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
    }
    
    
    //Action of Update status button
    @IBAction func btnUpdateStatusAction(_ sender: Any) {
        /*
        let vc = UIStoryboard.init(name: "ProfileStatus", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileStatusVC") as? ProfileStatusVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
    
    //Action of Delete Account button
    @IBAction func btnDeleteAccountAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "", message: "Do you want to delete this acount? " , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
        
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
            
            UserDefaults.standard.removeLoginSession()
            ContactUserModel.shared.deleteTableData()
            
            let vc = UIStoryboard.init(name: "Registration", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationVC
            
            self.navigationController?.pushViewController(vc!, animated: true)
            
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    //Action of Settings button
    @IBAction func btnSettingsAction(_ sender: Any) {
        /*
        let vc = UIStoryboard.init(name: "Settings", bundle: Bundle.main).instantiateViewController(withIdentifier: "SettingsVC") as? SettingsVC
        
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
        btnSearch.isHighlighted = true
    }
    
    
}
