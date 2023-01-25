//
//  LoginViewController.swift
//  Transo
//
//  Created by mac on 15/06/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
import LocalAuthentication
class LoginViewController: UIViewController {

    @IBOutlet var loginTF: UITextField!
    
    @IBOutlet var passwordTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var login : Login_Base?
    @IBAction func loginAction(_ sender: UIButton) {
        if loginTF.text == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please enter email/username")
        }else if passwordTf.text == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please enter password")
        }else{
            loginAc()
        }
    }
     func authenticateTapped() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        //Successfully Login
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "TabbarViewController") as! TabbarViewController
                        vc.modalTransitionStyle = .crossDissolve
                        vc.modalPresentationStyle = .fullScreen
                       
                        self!.present(vc, animated: true, completion: nil)
                    } else {
                        let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "OK", style: .default))
                        self?.present(ac, animated: true)
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Biometry unavailable", message: "Your device is not configured for biometric authentication.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    } 
    
    @IBAction func touchidAction(_ sender: UIButton) {
        let touch = UserDefaults.standard.bool(forKey: "TouchId")

        if touch == true{
       let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        if isLogin == true{
            self.authenticateTapped()
        }else{
            HAlert.ShowBoldToast(VC: self, msg: "First time You must login with Username and Password")
        }
        }
        else{
            HAlert.ShowBoldToast(VC: self, msg: "Enable Biomatric in app settings")
        }
    }
    
    func loginAc() {
        let url:String = URLs.BASE_URL + "?auth=123456&user=\(loginTF.text!)&pass=\(passwordTf.text!)&route=login"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Login_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    print(response.value)
                    if metaString == "success" || msgCode == "2000"
                    {
                        login = decodedata
                        let user = [
                            "id":decodedata.data!.id ?? "",
                            ]
                        UserDefaults.standard.setValue(user, forKey: "LoginUser")
                        UserDefaults.standard.set(true, forKey: "isLogin")
                      
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier: "TabbarViewController") as! TabbarViewController
                        vc.modalTransitionStyle = .crossDissolve
                        vc.modalPresentationStyle = .fullScreen
                       
                        self.present(vc, animated: true, completion: nil)
                       
                       
                        
                        
                    }
                    else
                    {
                        showAlert(Msg: metaString, Title: "Sorry Cant Load This Page", VC: self)
                    }


                } catch let err
                {
                    let msg = err.localizedDescription
                    let title = "Something went wrong"
//                    showAlert(Msg: title, Title: msg, VC: self)
                    print(err)
                }
                break
            default:
                break
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
class HAlert{
    
    class func Showalert(VC:UIViewController,msg:String,title:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        VC.present(alert, animated: true) {
            var i = 1
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
                if i == 3{
                    Timer.invalidate()
                    alert.dismiss(animated: true, completion: nil)
                }else{
                    i += 1
                }
            }
        }
    }
    class func ShowAlerTost(VC:UIViewController,title:String,msg:String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        VC.present(alert, animated: true) {
            var i = 1
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
                if i == 3{
                    Timer.invalidate()
                    alert.dismiss(animated: true, completion: nil)
                }else{
                    i += 1
                }
            }
        }
    }
    
    class func ShowToast(VC:UIViewController,msg:String){
        let alert = UIAlertController(title: msg, message: "", preferredStyle: .alert)
        VC.present(alert, animated: true) {
            var i = 1
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
                if i == 3{
                    Timer.invalidate()
                    alert.dismiss(animated: true, completion: nil)
                }else{
                    i += 1
                }
            }
        }
    }
    class func ShowBoldToast(VC:UIViewController,msg:String){
        let alert = UIAlertController(title: msg, message: "", preferredStyle: .alert)
        VC.present(alert, animated: true) {
            var i = 1
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
                if i == 3{
                    Timer.invalidate()
                    alert.dismiss(animated: true, completion: nil)
                }else{
                    i += 1
                }
            }
        }
    }
    
}
