//
//  WelComeVC.swift
//  Vhortext
//
//  Created by LNSEL on 12/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit
import Contacts
import Toast_Swift

class ContactSyncVC: UIViewController {

    
    /*MARK:- -----------------------------------UI Design(start)----------------------------------*/
    @IBOutlet weak var lblSync: UILabel!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    let loadingGroup = STLoadingGroup(side: 45, style: .submit)
    var style = ToastStyle()
    /*MARK:- -----------------------------------UI Design(end)----------------------------------*/
    
    var usrAppType = String()
    var usrAppVersion = String()
    var usrDeviceId = String()
    var usrId = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*MARK:- -----------------------------------UI Design(start)-----------------------------*/
        lblSync.text = "Please wait while your contacts are \nbeing synced."
        
        activityLoader.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        activityLoader.color = UIColor.black
        activityLoader.startAnimating()
        activityLoader.isHidden = true
        
        //UIApplication.shared.beginIgnoringInteractionEvents() ----- Disable user interaction
        //UIApplication.shared.endIgnoringInteractionEvents()   ----- Anable user interaction
        
        self.btnContinue.layer.cornerRadius = self.btnContinue.bounds.size.width/2
        btnContinue.layer.backgroundColor = UIColor.orange.cgColor
        
        loadingGroup.show(self.btnContinue)
        
        /*MARK:------------------------------------UI Design(end)----------------------------------*/
        
        
        self.usrAppType = UserDefaults.standard.getUsrAppType()
        self.usrAppVersion = UserDefaults.standard.getUsrAppVersion()
        self.usrDeviceId = UserDefaults.standard.getUsrDeviceId()
        self.usrId = UserDefaults.standard.getUsrId()
        
        fetchPhoneBookContacts()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func continueAction(_ sender: Any) {
        
        let vc = UIStoryboard.init(name: "InviteContacts", bundle: Bundle.main).instantiateViewController(withIdentifier: "InviteContactsVC") as? InviteContactsVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }

    
    
    func fetchPhoneBookContacts(){
        
        let store = CNContactStore()
        
        Constants.Values.phonebookContacts.removeAll()
        
        store.requestAccess(for: .contacts){ (granted, err) in
            if let err = err {
                Log.e("Failed to request Access: \(err)")
            }
            
            if(granted){
                Log.i("Access granted")
                
                let keys = [CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                
                do{
                    try store.enumerateContacts(with: request, usingBlock: {(contact, stopPointerIfYouWantToStopEnumerating) in
                        
                        let phoneString = contact.phoneNumbers.first?.value.stringValue ?? ""
                        
                        if(phoneString != ""){
                            let getPhoneNo = (contact.phoneNumbers[0].value ).value(forKey: "digits") as! String
                            
                            let phoneNo = String(getPhoneNo.filter { !"()-".contains($0) })
                    
                            Constants.Values.phonebookContacts.append(phoneNo)
                            
                        }
                        
                    })
                    
                    let contactSyncPresenter = ContactSyncPresenter(contactSyncService: ContactSyncService())
                    contactSyncPresenter.attachView(view: self)
                    
                    Log.i("getSyncedContacts() called")
                    contactSyncPresenter.getSyncedContacts(url: UrlConstants.apiGetUsers, usrId: self.usrId, usrDeviceId: self.usrDeviceId, usrAppType: self.usrAppType, usrAppVersion: self.usrAppVersion)
                    
                } catch let err {
                    Log.e("Failed to enumurate contacts: \(err)")
                    
                }
                
                
                
            }else{
                Log.w("Access Denied")
            }
            
        }
    
    }
    


}


extension ContactSyncVC: ContactSyncView{
    
    func startLoading(){
        loadingGroup.startLoading()
    }
    
    func contactSyncSuccess(message: String){
        loadingGroup.stopLoading()
        self.style.messageColor = .green
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
    func contactSyncFailed(message: String) {
        loadingGroup.stopLoading()
        self.style.messageColor = .white
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
}
