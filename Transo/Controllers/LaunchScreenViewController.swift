//
//  LaunchScreenViewController.swift
//  Transo
//
//  Created by mac on 23/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Alamofire
var BankString = [String]()
var Banks : Banks_Base?
var Countries = [String]()
var Glob_Relations : Relations_Base?
var Glob_StringRelation = [String]()
class LaunchScreenViewController: UIViewController {

    @IBOutlet var testingView: UIView!
    var countriesList : Countries_Base?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        FetchCountries()
        FetchRelations()
        FetchBanks()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        animation(viewAnimation: testingView)
    }
    func FetchBanks() {
        let url:String = URLs.BanksList
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Banks_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        Banks = decodedata
                        if Banks != nil{
                            for ban in Banks!.data!{
                                BankString.append(ban.bank_name ?? "")
                            }
                        }
                        print(Banks?.data!)
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
    func FetchRelations() {
        let url:String = URLs.Relations
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Relations_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        Glob_Relations = decodedata
                       
                        if Glob_Relations != nil
                        {
                         for ban in Glob_Relations!.data!{
                            print(ban.status ?? "")
                            print(ban.text ?? "")
                                  print(ban.value ?? "")
                            Glob_StringRelation.append(ban.text ?? "-1")
                            }
                            
                            print("Relationships : \(Glob_StringRelation)")
                        }
                        
                        
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

    func FetchCountries() {
        let url:String = URLs.Countries
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Countries_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        countriesList = decodedata
                       
                        if countriesList != nil
                        {
                         for ban in countriesList!.data!{
                                Countries.append(ban.country_name ?? "")
                            }
                        }
                        
                        
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
    private func animation(viewAnimation: UIView) {
        UIView.animate(withDuration: 2, animations: {
            viewAnimation.frame.origin.x = +viewAnimation.frame.width
        }) { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { // Change `2.0` to the desired number of seconds.
                
                if let temp = UserDefaults.standard.value(forKey: "LoginUser") as? [String:String]{
                
                if let x = temp["id"]! as? String{
                if x != "" {
                    sender_id = x
                   
                }
                }
                }
                let isLogOut = UserDefaults.standard.bool(forKey: "isLogOut")
               
                if sender_id != "" && isLogOut == false{
                
                
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "TabbarViewController") as! TabbarViewController
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
               
                self.present(vc, animated: true, completion: nil)
                }else{
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                   
                    self.present(vc, animated: true, completion: nil)
                }
               // Code you want to be delayed
            }
           
            
//            UIView.animate(withDuration: 2, delay: 1, options: [.curveEaseIn], animations: {
//                viewAnimation.frame.origin.x -= viewAnimation.frame.width
//            })

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
