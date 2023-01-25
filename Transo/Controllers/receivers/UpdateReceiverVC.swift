//
//  UpdateReceiverVC.swift
//  Transo
//
//  Created by mac on 23/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import iOSDropDown
import Alamofire
import KRProgressHUD
import IQKeyboardManagerSwift
class UpdateReceiverVC: UIViewController {

    
    @IBOutlet weak var updateReceiverBtn: UIButton!
    @IBOutlet weak var locationIdView: UIView!
    @IBOutlet weak var SelectBankLbl: UILabel!
    @IBOutlet weak var swiftCodeView: UIView!
    @IBOutlet weak var branchAddressView: UIView!
    @IBOutlet weak var branchCodeView: UIView!
    @IBOutlet weak var branchNameView: UIView!
    @IBOutlet weak var bankIdView: UIView!
    @IBOutlet weak var ibnBankAcountView: UIView!
    @IBOutlet weak var ifscView: UIView!
    
    var add = false
    
    @IBOutlet weak var ScreenLbl: UILabel!
    
    @IBOutlet weak var paymentReceivingDropDown: DropDown!
    @IBOutlet var BanksDropDown: DropDown!
    @IBOutlet var LocationIdTF: UITextField!
    @IBOutlet var SwiftCodeTF: UITextField!
    @IBOutlet var BranchAddressTF: UITextField!
    @IBOutlet var BranchTF: UITextField!
    @IBOutlet var BranchnameTF: UIView!
    @IBOutlet var BankIdTF: UITextField!
    @IBOutlet var BankAccountTF: UITextField!
    @IBOutlet var ifscTF: UITextField!
    @IBOutlet var idNumberTF: UITextField!
    @IBOutlet var idTypeTF: DropDown!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var stateTF: UITextField!
    @IBOutlet var cityTF: UITextField!
    @IBOutlet var lastNameTf: UITextField!
    @IBOutlet var FirstName: UITextField!
    @IBOutlet var txtDatePicker: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var CountryDropDown: DropDown!
    @IBOutlet var RelationDropDown: DropDown!
    var UPdateReceiver : UPdateReceiver_msg_Base?
    let datePicker = UIDatePicker()
    var rcID = ""
    var seletedType = "Cash"
    var types = ["Bank","Cash"]
    var data : Benificiary_Base.Data?
    override func viewDidLoad() {
        super.viewDidLoad()
        idTypeTF.optionArray = ["CNIC","Passport","Foriegn ID"]
//        self.seletedType = "Cash"
        paymentReceivingDropDown.text = "Cash"
        self.ifscView.isHidden = true
        self.ibnBankAcountView.isHidden = true
        self.bankIdView.isHidden = true
        self.BranchnameTF.isHidden = true
        self.branchCodeView.isHidden = true
        self.branchAddressView.isHidden = true
        self.swiftCodeView.isHidden = true
        self.SelectBankLbl.isHidden = true
        self.BanksDropDown.isHidden = true
        self.locationIdView.isHidden = true
        
        idTypeTF.optionArray = ["CNIC","Passport","Foriegn ID Number"]
        if add == true{
            ScreenLbl.text = "Add Receiver"
            updateReceiverBtn.setTitle("Add Receiver", for: .normal)
        }
        
        BanksDropDown.optionArray = types
        dateLabel.text = ""
        BanksDropDown.optionArray = BankString
        CountryDropDown.optionArray = Countries
        RelationDropDown.optionArray = Glob_StringRelation
        showDatePicker()
        paymentReceivingDropDown.optionArray = types
        paymentReceivingDropDown.didSelect { selectedText, index, id in
            print(selectedText)
            if selectedText == "Bank"{
                self.seletedType = "Bank"
                self.ifscView.isHidden = false
                self.ibnBankAcountView.isHidden = false
                self.bankIdView.isHidden = false
                self.BranchnameTF.isHidden = false
                self.branchCodeView.isHidden = false
                self.branchAddressView.isHidden = false
                self.swiftCodeView.isHidden = false
                self.SelectBankLbl.isHidden = false
                self.BanksDropDown.isHidden = false
                self.locationIdView.isHidden = false
            }else{
                self.seletedType = "Cash"
                self.ifscView.isHidden = true
                self.ibnBankAcountView.isHidden = true
                self.bankIdView.isHidden = true
                self.BranchnameTF.isHidden = true
                self.branchCodeView.isHidden = true
                self.branchAddressView.isHidden = true
                self.swiftCodeView.isHidden = true
                self.SelectBankLbl.isHidden = true
                self.BanksDropDown.isHidden = true
                self.locationIdView.isHidden = true
            }
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if data != nil{
            KRProgressHUD.show(withMessage: "Loading...", completion: nil)
            getBenificiaryDetails()
//            LocationIdTF.text = data?.paddress
//            FirstName.text = data!.pname
//            lastNameTf.text = data!.lname
//            cityTF.text = data!.city ?? ""
//            CountryDropDown.text = data!.country ?? ""
//            BankAccountTF.text = data!.bank_ac ?? ""
////             data!.bank_code ?? ""
//            BranchTF.text =  data!.branch ?? ""
//           rcID = data!.id ?? ""
//            phoneTF.text = data!.phone ?? ""
//            stateTF.text = data!.pstate ?? ""
////            data!.ptype ?? ""
            
        }
    }
    @IBAction func datePickerChanged(_ sender: Any) {
        showDatePicker()

    }
   
    func showDatePicker(){
      //Formate Date
      datePicker.datePickerMode = .date

     //ToolBar
     let toolbar = UIToolbar();
     toolbar.sizeToFit()
     let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

   toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
   txtDatePicker.inputAccessoryView = toolbar
    txtDatePicker.inputView = datePicker

   }

    @objc func donedatePicker(){
    let formatter = DateFormatter()
     formatter.dateFormat = "dd/MM/yyyy"
//     txtDatePicker.text = formatter.string(from: datePicker.date)
        dateLabel.text = formatter.string(from: datePicker.date)
     self.view.endEditing(true)
   }
   @objc func cancelDatePicker(){
      self.view.endEditing(true)
    }
  
    @IBOutlet var BranchNametf: UITextField!
  
    @IBOutlet var addressTF: UITextField!
    @IBAction func addressTF(_ sender: Any) {
    }
    @IBAction func BackAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func UpdateAction(_ sender: UIButton) {
        
        if seletedType == "Bank"{
        if FirstName.text! == "" || lastNameTf.text! == "" || RelationDropDown.text == "" || dateLabel.text == "" || addressTF.text! == "" || cityTF.text! == "" || CountryDropDown.text! == "" || stateTF.text! == "" || phoneTF.text! == "" || emailTF.text! == "" || idNumberTF.text! == "" || BankAccountTF.text! == "" || BranchTF.text! == "" || BranchNametf.text! == "" || BranchAddressTF.text! == ""{
            showAlert(Msg: "", Title: "Please Fill All Fields", VC: self)
        }else{
            KRProgressHUD.show(withMessage: "loading...", completion: nil)
            if add == false{
            updateReceiver()
            }else{
                AddReceiver()
            }
        }
        }else{
            if FirstName.text! == "" || lastNameTf.text! == "" || RelationDropDown.text == "" || dateLabel.text == "" || addressTF.text! == "" || cityTF.text! == "" || CountryDropDown.text! == "" || stateTF.text! == "" || phoneTF.text! == "" || emailTF.text! == "" || idNumberTF.text! == "" || idTypeTF.text! == ""{
                showAlert(Msg: "", Title: "Please Fill All Fields", VC: self)
            }else{
                KRProgressHUD.show(withMessage: "loading...", completion: nil)
                if add == false{
                updateReceiver()
                }else{
                    AddReceiver()
                }
            }
        }
        
        
        
    }
    var benificiaryDetails : benificiaryDetails_Base?
    func getBenificiaryDetails() {
        URLs.Receiver_Id = data!.id ?? ""
        let url:String = URLs.BenificiaryDetails
        print(url)
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(benificiaryDetails_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        benificiaryDetails = decodedata
                        LocationIdTF.text = benificiaryDetails!.data![0].location_id ?? ""
                                    FirstName.text =  benificiaryDetails!.data![0].pname ?? ""
                                    lastNameTf.text =  benificiaryDetails!.data![0].lname ?? ""
                                    cityTF.text =  benificiaryDetails!.data![0].city ?? ""
                                    CountryDropDown.text =  benificiaryDetails!.data![0].country ?? ""
                                    BankAccountTF.text =  benificiaryDetails!.data![0].bank_ac ?? ""
                        //             data!.bank_code ?? ""
                                    BranchTF.text =   benificiaryDetails!.data![0].branch ?? ""
                                   rcID =  benificiaryDetails!.data![0].id ?? ""
                                    phoneTF.text =  benificiaryDetails!.data![0].phone ?? ""
                                    stateTF.text =  benificiaryDetails!.data![0].pstate ?? ""
                        emailTF.text = benificiaryDetails!.data![0].email ?? ""
                        paymentReceivingDropDown.text = benificiaryDetails!.data![0].ptype ?? ""
                        addressTF.text = benificiaryDetails!.data![0].paddress ?? ""
                        RelationDropDown.text = benificiaryDetails!.data![0].relationship ?? ""
                        idTypeTF.text = benificiaryDetails!.data![0].cnic_type ?? ""
                        idNumberTF.text = benificiaryDetails!.data![0].cnic ?? ""
                        BanksDropDown.text = benificiaryDetails!.data![0].bank ?? ""
                        SwiftCodeTF.text = benificiaryDetails!.data![0].swift_code ?? ""
                        BranchAddressTF.text = benificiaryDetails!.data![0].bank_address ?? ""
                        BankIdTF.text = benificiaryDetails!.data![0].bank_id ?? ""
                        BranchNametf.text = benificiaryDetails!.data![0].branch ?? ""
                        ifscTF.text = benificiaryDetails!.data![0].ifsc_code ?? ""
                        dateLabel.text = benificiaryDetails!.data![0].dob ?? ""
                        //            data!.ptype ?? ""
                        
                        if (benificiaryDetails!.data![0].ptype ?? "") == "Bank"{
                            self.seletedType = "Bank"
                            self.ifscView.isHidden = false
                            self.ibnBankAcountView.isHidden = false
                            self.bankIdView.isHidden = false
                            self.BranchnameTF.isHidden = false
                            self.branchCodeView.isHidden = false
                            self.branchAddressView.isHidden = false
                            self.swiftCodeView.isHidden = false
                            self.SelectBankLbl.isHidden = false
                            self.BanksDropDown.isHidden = false
                            self.locationIdView.isHidden = false
                        }else{
                            self.seletedType = "Cash"
                            self.ifscView.isHidden = true
                            self.ibnBankAcountView.isHidden = true
                            self.bankIdView.isHidden = true
                            self.BranchnameTF.isHidden = true
                            self.branchCodeView.isHidden = true
                            self.branchAddressView.isHidden = true
                            self.swiftCodeView.isHidden = true
                            self.SelectBankLbl.isHidden = true
                            self.BanksDropDown.isHidden = true
                            self.locationIdView.isHidden = true
                        }
                        KRProgressHUD.dismiss()
                        
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
                    print(err)
                }
                break
            default:
                KRProgressHUD.dismiss()
                break
            }
        }
    }
    func GetBanks() {
        var url = URLs.BASE_URL  + "?auth=123456&action=update_rcv&rid=\(rcID)&snd_id=\(sender_id)&route=utilities&auth=123456&method=update_receiver&ptype=Bank&pname=\(FirstName.text!)&lname=\(lastNameTf.text!)&relationship=\(RelationDropDown.text!)&dob=\(dateLabel.text!)&paddress=\(addressTF.text!)&city=\(cityTF.text!)&city=\(cityTF.text!)&country=\(CountryDropDown.text!)&pstate=\(stateTF.text!)&phone=\(phoneTF.text!)&email=\(emailTF.text!)&cnic_type=CNIC&cnic=\(idNumberTF.text!)&ifsc_code=\(ifscTF.text!)&bank=Zarghoon&bank_ac=\(BankAccountTF.text!)&bank_id=\(BankIdTF.text!)&branch=\(BranchAddressTF.text!)&BRANCH&bank_code=\(BranchAddressTF.text!)&bank_address=\(BranchAddressTF.text!)&swift_code=\(SwiftCodeTF.text!)&location_id=\(LocationIdTF.text!)"
        var urlString = (url)
       urlString = urlString.replacingOccurrences(of: " ", with: "_")
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(UPdateReceiver_msg_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        KRProgressHUD.dismiss()
                        UPdateReceiver = decodedata
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
    func updateReceiver() {
        var url = URLs.BASE_URL  + "?auth=123456&action=update_rcv&rid=\(rcID)&snd_id=\(sender_id)&route=utilities&auth=123456&method=update_receiver&ptype=Bank&pname=\(FirstName.text!)&lname=\(lastNameTf.text!)&relationship=\(RelationDropDown.text!)&dob=\(dateLabel.text!)&paddress=\(addressTF.text!)&city=\(cityTF.text!)&city=\(cityTF.text!)&country=\(CountryDropDown.text!)&pstate=\(stateTF.text!)&phone=\(phoneTF.text!)&email=\(emailTF.text!)&cnic_type=CNIC&cnic=\(idNumberTF.text!)&ifsc_code=\(ifscTF.text!)&bank=Zarghoon&bank_ac=\(BankAccountTF.text!)&bank_id=\(BankIdTF.text!)&branch=\(BranchAddressTF.text!)&BRANCH&bank_code=\(BranchAddressTF.text!)&bank_address=\(BranchAddressTF.text!)&swift_code=\(SwiftCodeTF.text!)&location_id=\(LocationIdTF.text!)"
        var urlString = (url)
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//       urlString = urlString.replacingOccurrences(of: " ", with: "_")
        
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(UPdateReceiver_msg_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        KRProgressHUD.dismiss()
                        UPdateReceiver = decodedata
//                       showAlert(Msg: "\(metaString)", Title: "Sucessfully", VC: self)
                        HAlert.ShowBoldToast(VC: self, msg: "Record Updated Sucessfully!")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            // Put your code which should be executed with a delay here
                            self.dismiss(animated: true, completion: nil)
                        }
                       
                        
                        
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
   
    func AddReceiver() {
//        var url = URLs.BASE_URL
//        let param : Parameters = [
//            "auth":"123456",
//            "action":"add_new_receiver",
//            "snd_id":"\(sender_id)",
//            "route":"utilities",
//            "method":"add_new_receiver",
//            "ptype":paymentReceivingType.text!,
//            "pname":fnameTF.text!,
//            "lname":lnameTF.text!,
//            "relationship":relation.text!,
//            "dob":dateLbl.text!,
//            "paddress":addressTF.text!,
//            "city":cityTF.text!,
//            "country":CountryDropDown.text!,
//            "pstate":stateTF.text!,
//            "phone":phoneTF.text!,
//            "email":emailTF.text!,
//            "cnic_type":idTypeTF.text!,
//            "cnic":idNumberTf.text!
//        ]

//        var urlString = (url)
//       urlString = urlString.replacingOccurrences(of: " ", with: "_")
        var url = URLs.BASE_URL  + "?auth=123456&action=add_new_receiver&rid=\(rcID)&snd_id=\(sender_id)&route=utilities&auth=123456&method=add_new_receiver&ptype=\(paymentReceivingDropDown.text!)&pname=\(FirstName.text!)&lname=\(lastNameTf.text!)&relationship=\(RelationDropDown.text!)&dob=\(dateLabel.text!)&paddress=\(addressTF.text!)&city=\(cityTF.text!)&city=\(cityTF.text!)&country=\(CountryDropDown.text!)&pstate=\(stateTF.text!)&phone=\(phoneTF.text!)&email=\(emailTF.text!)&cnic_type=CNIC&cnic=\(idNumberTF.text!)&ifsc_code=\(ifscTF.text!)&bank=Zarghoon&bank_ac=\(BankAccountTF.text!)&bank_id=\(BankIdTF.text!)&branch=\(BranchAddressTF.text!)&BRANCH&bank_code=\(BranchAddressTF.text!)&bank_address=\(BranchAddressTF.text!)&swift_code=\(SwiftCodeTF.text!)&location_id=\(LocationIdTF.text!)"
        var urlString = (url)
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
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
//                        addReceiver = decodedata
//                       showAlert(Msg: "\(metaString)", Title: "Sucessfully", VC: self)
                        HAlert.ShowBoldToast(VC: self, msg: "Beneficiary Added Sucessfully")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            // Put your code which should be executed with a delay here
                            self.dismiss(animated: true, completion: nil)
                        }
                        
                        
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
}
