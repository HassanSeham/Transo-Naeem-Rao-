//
//  TransactionDetailsViewController.swift
//  Transo
//
//  Created by mac on 09/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
class TransactionDetailsViewController: UIViewController {

    @IBOutlet var emaillbl: UILabel!
    @IBOutlet var countrylbl: UILabel!
    @IBOutlet var statelbl: UILabel!
    @IBOutlet var citylbl: UILabel!
    @IBOutlet var adresslbl: UILabel!
    @IBOutlet var namelbl: UILabel!
    @IBOutlet var totalLbl: UILabel!
    @IBOutlet var chargeslbl: UILabel!
    @IBOutlet var Trade: UILabel!
    @IBOutlet var titleGbp: UILabel!
    var title_gbp = ""
    var trade = ""
    var charges = ""
    var total = ""
    var posttocm = ""
    var rcvId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleGbp.text = title_gbp
        chargeslbl.text = charges
        Trade.text = trade
        totalLbl.text = total
        print(rcvId)
        
    }
    var trnas : TransDetails_Base?
    @IBAction func BackAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func FetchTransactions() {
        let url:String = URLs.BASE_URL + "?auth=123456&route=utilities&method=get_receiver&id=\(rcvId)0&snd_id=\(sender_id)"
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(TransDetails_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        trnas = decodedata
                        let tdata = decodedata.data![0]
                        
                        self.namelbl.text = ((tdata.lname ?? "") + (tdata.pname ?? ""))
                        self.adresslbl.text = tdata.paddress ?? ""
                        self.citylbl.text = tdata.city ?? ""
                        self.statelbl.text = tdata.pstate ?? ""
                        self.countrylbl.text = tdata.country ?? ""
                        self.emaillbl.text = tdata.email ?? ""
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
