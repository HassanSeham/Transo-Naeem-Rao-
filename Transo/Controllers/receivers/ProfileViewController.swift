//
//  ProfileViewController.swift
//  Transo
//
//  Created by mac on 23/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import KRProgressHUD
import Alamofire
var prof : getUserProfile_Base?
var sender_id = ""
class ProfileViewController: UIViewController {

    @IBOutlet var Addresslbl: UILabel!
    @IBOutlet var numberLbl: UILabel!
    @IBOutlet var NameLbl: UILabel!
    @IBOutlet var emailLbl: UILabel!
    @IBOutlet var userNamelbl: UILabel!
    @IBOutlet var userimg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        KRProgressHUD.show(withMessage: "Loading...", completion: nil)
        FetchProfile()
        // Do any additional setup after loading the view.
    } 
    
    @IBAction func Logout(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "isLogOut")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
       
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func BackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func EditProfileAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "EditProfileViewController") as! EditProfileViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
       
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func LoginWithTouchId(_ sender: UISwitch) {
        if sender.isOn{
            UserDefaults.standard.set(true, forKey: "TouchId")
        }else{
            UserDefaults.standard.set(false, forKey: "TouchId")
        }
    }
    
    func FetchProfile(){
//        let url:String = URLs.BASE_URL + "?auth=123456&route=utilities&method=get_sender&sender_id=10&snd_id=\(sender_id)"
        let url:String = URLs.BASE_URL + "?route=utilities&method=get_sender&sender_id=\(sender_id)&auth=123456"
        print(url)
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(getUserProfile_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        prof = decodedata
                        let Pdata = prof!.data![0]
                        var name = prof!.data![0].fname ?? ""
                        name.append(" ")
                        name.append(prof!.data![0].lname ?? "")
                        self.userNamelbl.text = (prof!.data![0].fname ?? "") + (prof!.data![0].lname ?? "") ?? ""
                        self.userNamelbl.text = name
                        self.emailLbl.text = Pdata.email ?? ""
                        self.NameLbl.text = Pdata.fname ?? Pdata.lname
                        self.numberLbl.text = Pdata.phone ?? ""
                        var address =  Pdata.address1 ?? ""
                        address.append(" ")
                        
                        address.append( Pdata.city ?? "")
                        address.append(" ")
                        address.append( Pdata.county ?? "")
                        self.Addresslbl.text = Pdata.address1 ?? ""
                        self.Addresslbl.text = address
                        KRProgressHUD.dismiss()
//                        myCollectionView.reloadData()
                    }
                    else
                    {
                        KRProgressHUD.dismiss()
                        showAlert(Msg: metaString, Title: "Sorry Cant Load This Page", VC: self)
                    }


                } catch let err
                {
                    KRProgressHUD.dismiss()
                    let msg = err.localizedDescription
                    let title = "Something went wrong"
//                    showAlert(Msg: title, Title: msg, VC: self)
                    HAlert.ShowBoldToast(VC: self, msg: "Server Error")
                    print(err)
                }
                break
            default:
                KRProgressHUD.dismiss()
                break
            }
        }
    }
}
