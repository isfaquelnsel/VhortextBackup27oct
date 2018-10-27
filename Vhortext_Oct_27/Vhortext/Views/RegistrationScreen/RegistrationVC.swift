//
//  ViewController.swift
//  Vhortext
//
//  Created by LNSEL on 11/09/18.
//  Copyright © 2018 lnsel. All rights reserved.
//

import UIKit
import CountryList
import Alamofire
import Toast_Swift

class RegistrationVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    
    /*MARK:-------------------------------------UI Design(start)-----------------------*/
    @IBOutlet weak var viewUserName: UIView!
    @IBOutlet weak var viewMobileNumber: UIView!
    @IBOutlet weak var txtFieldUserName: UITextField!
    @IBOutlet weak var txtFieldMobileNum: UITextField!
    @IBOutlet weak var viewBoarder: UIView!
    
    @IBOutlet weak var txtFldCountryCode: UITextField!
    @IBOutlet weak var btnContinue: UIButton!
    @IBOutlet weak var btnTermsOfUse: UIButton!
    @IBOutlet weak var btnPrivacyPolicy: UIButton!
    
    var style = ToastStyle()
    /*MARK:--------------------------------------UI Design(end)-----------------------*/
    

    var countryList = CountryList()
    var usrCountryCode = String()
    var usrCountryName = String()
    var usrCountryShortName = String()
    var usrMobileNo = String()
    var usrDeviceId = String()
    var usrAppVersion = String()
    var usrAppType = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*MARK:----------------------UI Design(start)-----------------------*/
        txtFieldUserName.autocorrectionType = .no
        txtFieldMobileNum.autocorrectionType = .no
        txtFieldUserName.keyboardType = UIKeyboardType.asciiCapable
        countryList.delegate = self
        
        btnContinue.layer.cornerRadius = 0.5 * btnContinue.bounds.size.width
        btnContinue.layer.backgroundColor = UIColor.orange.cgColor
        
        btnTermsOfUse.tintColor = UIColor.underline_green
        btnPrivacyPolicy.tintColor = UIColor.underline_green
        btnTermsOfUse.addBottomBorder(color: UIColor.underline_green, height: 0.5)
        btnPrivacyPolicy.addBottomBorder(color: UIColor.underline_green, height: 0.5)
        
        txtFieldUserName.delegate = self
        txtFieldMobileNum.delegate = self
        
        createViews()
        
        txtFieldUserName.text = "test"
        txtFieldMobileNum.text = "9876543211"
        /*MARK:----------------------UI Design(end)-----------------------*/
        
        
        CountryInfo()
        
        usrDeviceId = UIDevice.current.identifierForVendor!.uuidString
        usrAppType = "ios"
        usrAppVersion =  Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        Constants.Values.usrDeviceId = usrDeviceId
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    /*MARK:- ------------------UI Design(start)-----------------------------*/
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
     //Hide the keyboard when touch on view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func createViews() {
        
        //To hide navigation bar.
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        txtFldCountryCode.addTarget(self, action: #selector(countryCodesList), for: .touchDown)
        viewBoarderColor()
        textFieldPlaceholder()
        dismissKeyBoard()
        
    }
    
    
    @objc func countryCodesList() {
        
        let navController = UINavigationController(rootViewController: countryList)
        self.present(navController, animated: true, completion: nil)
        
    }
    
    //add boarder colors to Views
    func viewBoarderColor(){
        
        self.viewUserName.layer.borderWidth = 2
        self.viewUserName.layer.borderColor = UIColor.view_yellow.cgColor
        
        self.viewMobileNumber.layer.borderWidth = 2
        self.viewMobileNumber.layer.borderColor = UIColor.view_yellow.cgColor
        
        self.viewBoarder.layer.borderWidth = 4
        self.viewBoarder.layer.borderColor = UIColor(white: 1.0, alpha: 0.2).cgColor
        
    }
    
    
    
    //textField placeholder
    func textFieldPlaceholder() {
        
        txtFieldUserName.placeholder = "Enter your name"
        txtFieldUserName.attributedPlaceholder = NSAttributedString(string: "Enter your name",attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
        
        txtFieldMobileNum.placeholder = "Enter mobile number"
        txtFieldMobileNum.attributedPlaceholder = NSAttributedString(string: "Enter mobile number",attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
    }
    
    //add button to keyboard and its action
    func dismissKeyBoard(){
        
        //init toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        self.txtFieldMobileNum.inputAccessoryView = toolbar
        
    }
    
    @objc func doneButtonAction() {
        
        self.view.endEditing(true)
        
    }
    
    //To move View up while entering text
    func animate(_ textField: UITextField, up: Bool) {
        
        let movementDistance: Int = 80
        let movementDuration: Float = 0.5
        
        // It will animate the middle view based on the Int value.
        let movement: Int = (up ? -movementDistance : movementDistance)
        UIView.beginAnimations("anim", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(TimeInterval(movementDuration))
        view.frame = view.frame.offsetBy(dx: CGFloat(0), dy: CGFloat(movement))
        UIView.commitAnimations()
        
        
    }
    
    //validation for TextField maximum characters(start)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text : NSString = (textField.text! as NSString).replacingCharacters(in: range, with: string) as NSString
        
        return text.length <= 16
        
    }
    
    
    //validation for TextField return and begin editing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtFieldUserName {
            txtFieldMobileNum.becomeFirstResponder()
        } else {
            txtFieldMobileNum.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        animate(txtFieldUserName, up: true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animate(txtFieldUserName, up: false)
        
    }
    /*MARK:-------------------------------------UI Design(end)-----------------------------------*/
    
    
    
    //Terms of Use
    @IBAction func btnTermsOfUseAction(_ sender: Any) {
        
        /*
        let vc = UIStoryboard.init(name: "ContentWebView", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContentWebViewVC") as? ContentWebViewVC
        
        vc?.receivingText = "Terms Of Use"
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
    //Privacy Policy button action
    @IBAction func btnPrivacyPolicyAction(_ sender: Any) {
        /*
        let vc = UIStoryboard.init(name: "ContentWebView", bundle: Bundle.main).instantiateViewController(withIdentifier: "ContentWebViewVC") as? ContentWebViewVC
        
        vc?.receivingText = "Privacy Policy"
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
    }
    
 
    //o get the current country code and country name
    func CountryInfo() {
        
        // MARK:- To get current Contry code
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            
            usrCountryShortName = countryCode
            
            usrCountryCode = Constants.Values.countryDictionary[countryCode]!
            print("current country code ----> \("+"+usrCountryCode)")
            
            let currentCountryFlag = flag(country:countryCode)
            print("currentCountryFlag---->\(currentCountryFlag)")
            
            txtFldCountryCode.text = currentCountryFlag+" +"+usrCountryCode+" ▿"
            
        }
        
        //MARK: - To get current Contry name
        let localIdentifier = Locale.current.identifier
        let locale = NSLocale(localeIdentifier: localIdentifier)
        
        if let countryCodeForName = locale.object(forKey: .countryCode) as? String {
            
            if let country:String = locale.displayName(forKey: .countryCode, value: countryCodeForName) {
                print("countryName ----> \(country)")
                usrCountryName = country
            }
        }
    }
    

    //Continue button Action
    @IBAction func btnContinueAction(_ sender: Any) {
        
        self.view.endEditing(true)
        
        if txtFieldUserName.text!.isEmpty || txtFieldMobileNum.text!.isEmpty {
            
            self.style.messageColor = .white
            self.view.makeToast("Please enter details", duration: 2.0, position: .center, style: self.style)
            
        } else {
            
            if txtFieldMobileNum.text!.characters.count >= 5 {
                
                let countryCode = txtFldCountryCode.text!.dropFirst()
                
                let alert = UIAlertController(title: "Message", message: "Do you want to register with" + " " + "+" + usrCountryCode + " " + txtFieldMobileNum.text!, preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
                
                alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in
                    

                    let regPresenter = RegistrationPresenter(registrationService: RegistrationService())
                    regPresenter.attachView(view: self)
                    
                    var url = String()
                    url = UrlConstants.apiRegistration
                    Log.i("getRegistration() called")
                    regPresenter.getRegistration(
                        url: url,
                        usrUserName: self.txtFieldUserName.text!,
                        usrMobileNo: self.txtFieldMobileNum.text!,
                        usrDeviceId: self.usrDeviceId,
                        usrTokenId: "tftyff",
                        usrCountryCode: "+" + self.usrCountryCode,
                        usrAppType: self.usrAppType,
                        usrAppVersion: self.usrAppVersion,
                        usrCountryName: self.usrCountryName,
                        usrCountryShortName: self.usrCountryShortName
                    )
                    
                }))
                
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }

    



}



//country list delegate provide info of selected country
extension RegistrationVC: CountryListDelegate {
    
    func selectedCountry(country: Country) {
        
        print("contryName --- > \(String(describing: country.name))")
        print("contryFlag ----> \(String(describing: country.flag))")
        print("countryCode ----> \(country.countryCode)")
        print("phoneExtension ----> \(country.phoneExtension)")
        
        usrCountryName = country.name!
        usrCountryShortName = country.countryCode
        usrCountryCode = country.phoneExtension
        
        self.txtFldCountryCode.text = (country.flag ?? "")+" +"+country.phoneExtension+" ▿"
    }
    
    
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
}



extension RegistrationVC: RegistrationView{
    
    func startLoading() {
        let loadingGroup = STLoadingGroup(side: 45, style: .submit)
        loadingGroup.show(self.btnContinue)
        loadingGroup.startLoading()
    }
    
  
    
    func registrationSuccess(registrationReturnData: RegistrationReturnData) {
        
        let loadingGroup = STLoadingGroup(side: 45, style: .submit)
        loadingGroup.show(self.btnContinue)
        loadingGroup.stopLoading()

        let vc = UIStoryboard.init(name: "OTPVerification", bundle: Bundle.main).instantiateViewController(withIdentifier: "OTPVerificationVC") as? OTPVerificationVC
        
                vc?.usrMobileNo = registrationReturnData.usrMobileNo
                vc?.usrCountryCode = registrationReturnData.usrCountryCode
                vc?.usrUserName = registrationReturnData.usrUserName
       
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func registrationFailed(message: String) {
        self.style.messageColor = .white
        self.view.makeToast(message, duration: 2.0, position: .center, style: self.style)
    }
    
}
