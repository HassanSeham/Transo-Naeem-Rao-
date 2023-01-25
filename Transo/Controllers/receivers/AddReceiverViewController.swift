//
//  AddReceiverViewController.swift
//  Transo
//
//  Created by mac on 23/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import iOSDropDown
import Alamofire
import KRProgressHUD
class AddReceiverViewController: UIViewController {
    @IBOutlet var CountryDropDown: DropDown!
    @IBOutlet var RelationsDropDown: DropDown!
    
    @IBOutlet weak var paymentReceivingType: DropDown!
    @IBOutlet weak var fnameTF: UITextField!
    @IBOutlet weak var lnameTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    
    @IBOutlet weak var relation: DropDown!
    var addReceiver : addReceiver_Base?
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var idNumberTf: UITextField!
    @IBOutlet weak var idTypeTF: DropDown!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    
    var paymentType = ["Bank","Other"]
    override func viewDidLoad() {
        super.viewDidLoad()
        RelationsDropDown.optionArray = Glob_StringRelation
        CountryDropDown.optionArray = Countries
        // Do any additional setup after loading the view.
    }
    @IBAction func BackAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func addReceiverAcrion(_ sender: UIButton) {
        if paymentReceivingType.text! == ""{
            
        }else if paymentReceivingType.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter Payment Receiving Type")
        }else if fnameTF.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter First Name")
        }else if lnameTF.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter Last Name")
        }else if relation.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter Relation")
        }else if dateLbl.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter Date")
        }else if addressTF.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter Address")
        }else if cityTF.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter City")
        }else if CountryDropDown.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter Country")
        }else if stateTF.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter State")
        }else if phoneTF.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter Phone Number")
        }else if emailTF.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter Email Address")
        }
        else if idTypeTF.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter Id Type")
        }else if idNumberTf.text! == ""{
            HAlert.ShowBoldToast(VC: self, msg: "Please Enter Id Number")
        }else{
            KRProgressHUD.show(withMessage: "Loading...", completion: nil)
        updateReceiver()
        }
     
    }
    
    func updateReceiver() {
        var url = URLs.BASE_URL
        let param : Parameters = [
            "auth":"123456",
            "action":"add_new_receiver",
            "snd_id":"\(sender_id)",
            "route":"utilities",
            "method":"add_new_receiver",
            "ptype":paymentReceivingType.text!,
            "pname":fnameTF.text!,
            "lname":lnameTF.text!,
            "relationship":relation.text!,
            "dob":dateLbl.text!,
            "paddress":addressTF.text!,
            "city":cityTF.text!,
            "country":CountryDropDown.text!,
            "pstate":stateTF.text!,
            "phone":phoneTF.text!,
            "email":emailTF.text!,
            "cnic_type":idTypeTF.text!,
            "cnic":idNumberTf.text!
        ]

        var urlString = (url)
       urlString = urlString.replacingOccurrences(of: " ", with: "_")
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.queryString, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(addReceiver_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    print(response.value)
                    if metaString == "success" || msgCode == "2000"
                    {
                        KRProgressHUD.dismiss()
                        addReceiver = decodedata
                       showAlert(Msg: "\(metaString)", Title: "Sucessfully", VC: self)
                        
                        
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
                    showAlert(Msg: title, Title: msg, VC: self)
                    print(err)
                }
                break
            default:
                KRProgressHUD.dismiss()
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
