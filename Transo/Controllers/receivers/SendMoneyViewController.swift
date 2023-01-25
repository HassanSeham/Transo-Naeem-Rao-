//
//  SendMoneyViewController.swift
//  Transo
//
//  Created by mac on 23/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
import iOSDropDown
class SendMoneyViewController: UIViewController, UITextFieldDelegate {

    var mainId = "-1"
    var procssing_rule = "calculate"
    var section : Section_Base?
    @IBOutlet var CompanyDropDown: DropDown!
    @IBOutlet var textF: UITextField!
    var StrCompany = [String]()
    var companies : Ava_Company_Base?
    override func viewDidLoad() {
        super.viewDidLoad()
        textF.delegate = self
        KRProgressHUD.show(withMessage: "Loading...", completion: nil)
GetAvaCompany()
        CompanyDropDown.didSelect { (Str, id, ind) in
            print("ID : \(id),Ind : \(ind) : \(Str)")
            KRProgressHUD.show(withMessage: "loading...", completion: nil)
            self.textF.text = ""
            self.totalAmountlbl.text = "0"
            self.mainId = self.companies!.data![id].mainid ?? "-1"
            self.GetSection(id: self.companies!.data![id].mainid ?? "-1")
            self.GetGBP(id: self.companies!.data![id].mainid ?? "-1")
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func BackAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var stationDD: DropDown!
    @IBOutlet var totalAmountlbl: UILabel!
    @IBOutlet var GbpRatelbl: UILabel!
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        if textField == textF{
            let gbp =  Double(GbpRatelbl.text ?? "0.0") ?? 0.0
            let newVal = (Double(textF.text! + string) ?? 0.0)
            totalAmountlbl.text = String(gbp * newVal)
        }
        
        return true
    }
    var submit : Submit_Base?
    
    @IBAction func SubmitBtnAction(_ sender: Any) {
        SubmitApi(id: mainId)
    }
    
    func SubmitApi(id:String) {
        let url:String = URLs.BASE_URL + "?route=make_order&method=make_new_order&comp_ids=23&station=63&fx_type=choice&cid=1&snd_id=\(sender_id)&rid=2&rcv_id=2&procssing_rule=calculate&amt_gbp=10&trate=0.95&amt_pkr=9.5&sub_mit=Yes"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Submit_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        
                        showAlertAction(title: "Confirmation", message: "Are You Sure you wnat to submit this reques?")
                        
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
    func showAlertAction(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            self.procssing_rule = "fire_transaction"
            self.SubmitApi(id: self.mainId)
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func GetSection(id:String) {
        let url:String = URLs.BASE_URL + "?auth=123456&route=utilities&method=get_station&q=\(id)"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Section_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        
                        section = decodedata
                        var temp = [String]()
                        for s in section!.data!{
                            
                            temp.append(s.company ?? "")
                        }
                        stationDD.optionArray = temp
                        stationDD.text = temp[0]
                        stationDD.selectedIndex = 0
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
    var gbp : GBP_Base?
    func GetGBP(id:String) {
        let url:String = URLs.BASE_URL + "?auth=123456&route=utilities&method=get_comp&q=\(id)"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(GBP_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                       gbp = decodedata
                        GbpRatelbl.text = gbp?.data!.rate ?? "0"
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
    func GetAvaCompany() {
        let url:String = URLs.BASE_URL + "?auth=123456&route=utilities&method=get_ava_company"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Ava_Company_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        companies = decodedata
                        var temp = [String]()
                        for c in companies!.data!{
                            temp.append(c.company ?? "")
                        }
                        StrCompany = temp
                        CompanyDropDown.optionArray = StrCompany
                        KRProgressHUD.dismiss()
//                        MyCollectionView.reloadData()
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
