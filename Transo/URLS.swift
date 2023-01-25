//
//  URLS.swift
//  Transo
//
//  Created by mac on 08/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import UIKit
public class URLs
{
    static var BASE_URL = "https://quantumqsystems.com/money/api/"
    static var get_benificiary_list = BASE_URL + "?auth=123456&route=utilities&method=get_benificiary_list&id=\(sender_id)"
    static var Trnasactions = BASE_URL + "?auth=123456&route=utilities&method=get_trans&id=\(sender_id)"
    static var Today_Rate = BASE_URL +  "?auth=123456&route=utilities&method=get_today_rate"
    static var Banners = BASE_URL +  "?auth=123456&route=utilities&method=get_mobile_app_banner"
    static var Countries = BASE_URL + "?auth=123456&route=utilities&method=get_country_list"
    static var terms = BASE_URL +  "?auth=123456&route=utilities&method=get_content&p=terms"
    static var ledger = BASE_URL + "?auth=123456&route=utilities&method=get_ledger&sender_id=\(sender_id)"
    static var Relations = BASE_URL + "?auth=123456&route=utilities&method=get_relation_list"
    static var BanksList = BASE_URL + "?auth=123456&route=utilities&method=get_bank_list"
    static var Receiver_Id = ""
    static var BenificiaryDetails = BASE_URL + "?auth=123456&route=utilities&method=get_receiver&id=\(Receiver_Id)&snd_id=\(sender_id)"
}



func showAlert(Msg:String,Title:String,VC:UIViewController)
{
    print(VC)
    if Msg.contains("Something went wrong") || Title.contains("Something went wrong") || Msg.contains("Exception") || Title.contains("Exception"){
        
    }else{
   let alertController = UIAlertController(title: Title, message:Msg, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Ok", style: .default))
    VC.present(alertController, animated: true, completion: nil)
    }
}
//class HAlert{
//    
//    class func ShowToast(VC:UIViewController,msg:String){
//        let alert = UIAlertController(title: "ProPracticeTracker", message: msg, preferredStyle: .alert)
//        VC.present(alert, animated: true) {
//            var i = 1
//            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
//                if i == 3{
//                    Timer.invalidate()
//                    alert.dismiss(animated: true, completion: nil)
//                }else{
//                    i += 1
//                }
//            }
//        }
//    }
//    class func ShowBoldToast(VC:UIViewController,msg:String){
//        let alert = UIAlertController(title: msg, message: "", preferredStyle: .alert)
//        VC.present(alert, animated: true) {
//            var i = 1
//            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (Timer) in
//                if i == 3{
//                    Timer.invalidate()
//                    alert.dismiss(animated: true, completion: nil)
//                }else{
//                    i += 1
//                }
//            }
//        }
//    }
//}
