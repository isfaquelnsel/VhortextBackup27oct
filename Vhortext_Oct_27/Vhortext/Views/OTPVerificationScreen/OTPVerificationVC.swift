//
//  OTPVerificationVC.swift
//  Vhortext
//
//  Created by LNSEL on 11/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit
import Toast_Swift


class OTPVerificationVC: UIViewController {

    
    /*MARK:-------------------------------UI Design(start)------------------------------*/
    @IBOutlet weak var lblAuthentication: UILabel!
    @IBOutlet weak var lblActivationCode: UILabel!
    
    @IBOutlet weak var topViewOtp: UIView!
    @IBOutlet weak var btmViewOtp: UIView!
    
    @IBOutlet weak var otpField1: UITextField!
    @IBOutlet weak var otpField2: UITextField!
    @IBOutlet weak var otpField3: UITextField!
    @IBOutlet weak var otpField4: UITextField!
    @IBOutlet weak var otpField5: UITextField!
    @IBOutlet weak var otpField6: UITextField!
    
    @IBOutlet weak var btnReEnterPhoneNumber: UIButton!
    @IBOutlet weak var btnReSendVerificationCode: UIButton!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    
    var style = ToastStyle()
    /*MARK:-------------------------------UI Design(end)------------------------------*/
    
    
    var usrCountryCode = String()
    var usrUserName = String()
    var usrMobileNo = String()
    
    //call service with presenter
    let otpVerificationPresenter = OTPVerificationPresenter(otpVerificationService: OTPVerificationService())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        /*MARK:-------------------------------UI Design(start)------------------------------*/
        activityLoader.isHidden = true
        activityLoader.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        activityLoader.color = UIColor.black
        
        //UIApplication.shared.beginIgnoringInteractionEvents()  --------To disable user interaction
        //UIApplication.shared.endIgnoringInteractionEvents()    --------To Enable user interaction
        
        //----top and bottom views for OTP------
        self.topViewOtp.layer.borderWidth = 0.5
        self.topViewOtp.layer.borderColor = UIColor.gray.cgColor
        self.btmViewOtp.layer.borderWidth = 0.5
        self.btmViewOtp.layer.borderColor = UIColor.gray.cgColor
        
        otpField1.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        otpField2.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        otpField3.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        otpField4.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        otpField5.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        otpField6.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.editingChanged)
        
        otpField1.delegate = self
        otpField2.delegate = self
        otpField3.delegate = self
        otpField4.delegate = self
        otpField5.delegate = self
        otpField6.delegate = self
        
        
        dismissKeyBoard()
        
        //To add button tint color and bottom boarder
        btnReEnterPhoneNumber.tintColor = UIColor.underline_green
        btnReSendVerificationCode.tintColor = UIColor.underline_green
        btnReEnterPhoneNumber.addBottomBorder(color: UIColor.underline_green, height: 0.5)
        btnReSendVerificationCode.addBottomBorder(color: UIColor.underline_green, height: 0.5)
        
        lblActivationCode.text = "We have sent a sms with activation code to your \n phone" + " " + usrCountryCode+" "+usrMobileNo
        
        //default OTP
        otpField1.text = "1"
        otpField2.text = "2"
        otpField3.text = "3"
        otpField4.text = "4"
        otpField5.text = "5"
        otpField6.text = "6"
        
        /*MARK:-------------------------------UI Design(end)------------------------------*/

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /*MARK:-------------------------------UI Design(start)------------------------------*/
    @objc func goToRegistration() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func dismissKeyBoard(){
        
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        //setting toolbar as inputAccessoryView
        self.otpField6.inputAccessoryView = toolbar
        
    }
    /*MARK:-------------------------------UI Design(end)------------------------------*/
    
    
    @objc func doneButtonAction() {
        
        if otpField1.text!.isEmpty || otpField2.text!.isEmpty || otpField3.text!.isEmpty || otpField4.text!.isEmpty || otpField5.text!.isEmpty || otpField6.text!.isEmpty {
            
            self.style.messageColor = .green
            self.view.makeToast("Please Enter Valid OTP", duration: 2.0, position: .center, style: self.style)
            
        } else {
            
            var otpUrl = String()
            otpUrl = UrlConstants.apiOTPVerification
            
            otpVerificationPresenter.attachView(view: self)
            
            Log.i("getOTPVerfication() called")
            otpVerificationPresenter.getOTPVerification(url: otpUrl, usrCountryCode: usrCountryCode, usrMobileNo: usrMobileNo, usrUserName: usrUserName, usrDeviceId: Constants.Values.usrDeviceId , usrTokenId: "tftyff", usrOTP: self.otpField1.text!+otpField2.text!+otpField3.text!+otpField4.text!+otpField5.text!+otpField6.text!, usrAppType: "iOS", usrAppVersion: "1.0")
            
        }
        
    }
    
    
    //Action of Re-Enter phone number
    @IBAction func btnReEnterPhoneNumberAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

    //Action of ReSend Verification code
    @IBAction func btnReSendVerificationCodeAction(_ sender: Any) {
        
        otpVerificationPresenter.attachView(view: self)
        
        var otpUrl = String()
        otpUrl = UrlConstants.apiResendOTP
        
        otpVerificationPresenter.getResendOTP(url: otpUrl, usrCountryCode: usrCountryCode, usrMobileNo: usrMobileNo, usrAppType: "iOS", usrAppVersion: "1.0")
        
    }
    

    
   
}




/*MARK:-------------------------------------UI Design(start)----------------------------------*/
extension OTPVerificationVC : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == otpField2 {
            if otpField1.text?.isEmpty == true {
                
                otpField2.text = ""
                otpField1.becomeFirstResponder()
                
            }
        } else if textField == otpField3 {
            if otpField1.text?.isEmpty == true {
                otpField1.becomeFirstResponder()
                otpField3.text = ""
            }
        } else if textField == otpField4 {
            
            if otpField1.text?.isEmpty == true {
                otpField1.becomeFirstResponder()
                otpField4.text = ""
            }
            
        } else if textField == otpField5 {
            
            if otpField1.text?.isEmpty == true {
                otpField1.becomeFirstResponder()
                otpField5.text = ""
                
            }
            
        } else if textField == otpField6 {
            
            if otpField1.text?.isEmpty == true {
                otpField1.becomeFirstResponder()
                otpField6.text = ""
                
            }
        }
        
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        let text : NSString = (textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString
        
        
        return text.length <= 1
        
    }
    
    
    @objc func textFieldDidChange(textField: UITextField){
        
        let text = textField.text
        
        if text?.utf16.count==1{
            switch textField{
            case otpField1:
                otpField2.becomeFirstResponder()
            case otpField2:
                otpField3.becomeFirstResponder()
            case otpField3:
                otpField4.becomeFirstResponder()
            case otpField4:
                otpField5.becomeFirstResponder()
            case otpField5:
                otpField6.becomeFirstResponder()
            case otpField6:
                otpField6.becomeFirstResponder()
            default:
                break
                
            }
            
        } else {
            switch textField{
            case otpField1:
                otpField1.becomeFirstResponder()
            case otpField2:
                otpField1.becomeFirstResponder()
            case otpField3:
                otpField2.becomeFirstResponder()
            case otpField4:
                otpField3.becomeFirstResponder()
            case otpField5:
                otpField4.becomeFirstResponder()
            case otpField6:
                otpField5.becomeFirstResponder()
            default:
                break
            }
            
        }
        
    }
}
/*MARK: - ------------------------------------UI Design(end)----------------------------------*/



extension OTPVerificationVC: OTPVerificationView{
    
    func startLoading(){
        activityLoader.startAnimating()
        
    }
    
    func otpVerificationSuccess(profileData: ProfileData){
        activityLoader.stopAnimating()
        
        UserDefaults.standard.createLoginSession(
            isLogin: true,
            usrId: profileData.usrId,
            usrCountryCode: profileData.usrCountryCode,
            usrMobileNo: profileData.usrMobileNo,
            usrUserName: profileData.usrUserName,
            usrTokenId: profileData.usrTokenId,
            usrDeviceId: profileData.usrDeviceId,
            usrProfileImage: profileData.usrProfileImage,
            usrProfileStatus: profileData.usrProfileStatus,
            usrLanguageId: profileData.usrLanguageId,
            usrLanguageName: profileData.usrLanguageName,
            usrLanguageSName: profileData.usrLanguageSName,
            usrGender: profileData.usrGender,
            usrLocationPermission: profileData.usrLocationPermission,
            usrTranslationPermission: profileData.usrTranslationPermission,
            usrPrivateNumberPermission: profileData.usrPrivateNumberPermission,
            usrOnlinePermission: profileData.usrOnlinePermission,
            usrNotificationPermission: profileData.usrNotificationPermission,
            usrFcmTokenId: profileData.usrFcmTokenId,
            usrAppVersion: profileData.usrAppVersion,
            usrAppType: profileData.usrAppType)
        
        let vc = UIStoryboard.init(name: "ContactSync", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContactSyncVC") as? ContactSyncVC
        
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func otpVerificationFailed(message: String){
        activityLoader.stopAnimating()
        self.style.messageColor = .white
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
    func resendOTPSuccess(status: String, message: String){
        activityLoader.stopAnimating()
        self.style.messageColor = .green
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
    
    func resendOTPFailed(message: String){
        activityLoader.stopAnimating()
        self.style.messageColor = .green
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
    
    
}

