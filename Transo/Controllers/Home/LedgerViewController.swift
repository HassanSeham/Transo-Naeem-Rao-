//
//  LedgerViewController.swift
//  Transo
//
//  Created by mac on 09/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
class LedgerViewController: UIViewController {

    @IBOutlet var myCollectionView: UICollectionView!
    var ledger : Ledger_Base?
    override func viewDidLoad() {
        super.viewDidLoad()
        KRProgressHUD.show(withMessage: "Loading...", completion: nil)
        Fetchledger()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var totalLbl: UILabel!
    
    func Fetchledger() {
        let url:String = URLs.ledger
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Ledger_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        ledger = decodedata
                        KRProgressHUD.dismiss()
                        myCollectionView.reloadData()
                        var credit = 0.0
                        var debit = 0.0
                        for led in ledger!.data!{
                            credit += (Double(led.credit ?? "0.0") ?? 0.0)
                            debit += (Double(led.debt ?? "0.0") ?? 0.0)
                            let total = (debit - credit)
                            totalLbl.text = "Total : \(total)"
                            
                        }
                        print(debit)
                        print(credit)
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
    @IBAction func BackAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension LedgerViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ledger != nil{
            return ledger!.data!.count
        }else{
            return 0
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ledgerCollectionViewCell
        if ledger != nil{
            let data = ledger!.data![indexPath.row]
            cell.DebitLbl.text = data.debt ?? ""
            cell.creditLbl.text = data.credit ?? ""
            cell.dateLbl.text = data.v_date ?? ""
            cell.MicNoLbl.text = data.mitcno ?? ""
      
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCollectionView.frame.width, height: 50)
    }
}
