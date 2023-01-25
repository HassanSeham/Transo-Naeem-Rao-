//
//  TransViewController.swift
//  Transo
//
//  Created by Apple on 05/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import KRProgressHUD
import Alamofire
class TransViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SearchtTextField: UITextField!
    @IBOutlet var myCollectionView: UICollectionView!
    
    var trnas : Transactions_Base?
    var SearchedData : Transactions_Base?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchtTextField.delegate = self
        KRProgressHUD.show(withMessage: "Loading...", completion: nil)
        FetchTransactions()
        // Do any additional setup after loading the view.
    }
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let searchText = SearchtTextField.text! + string
        
        if trnas != nil{
            if trnas!.data!.count > 0{
        SearchedData!.data = trnas!.data!.filter({ value -> Bool in
            
            return (value.fname!.lowercased().contains(searchText.lowercased()) || value.lname!.lowercased().contains(searchText.lowercased()) )
        })
        print("searched Result : \(SearchedData!.data!.count)")
           print(searchText)
                print(string)
                
                if searchText.count == 1 && string == ""{
                    SearchedData = trnas
                }
            }
        
        }
        
        
        myCollectionView.reloadData()
        return true
    }
    func FetchTransactions() {
        let url:String = URLs.Trnasactions
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            print(response.value)
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Transactions_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        trnas = decodedata
                        SearchedData = decodedata
                        KRProgressHUD.dismiss()
                        myCollectionView.reloadData()
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
extension TransViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if SearchedData != nil{
            return SearchedData!.data!.count
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! transCollectionViewCell
        if trnas != nil{
            let data = SearchedData!.data![indexPath.row]
            cell.idlbl.text = (data.comp_trans_id_sub ?? "") + " " + (data.comp_trans_id ?? "")
            cell.datelbl.text = data.tdate ?? ""
            cell.namelbl.text = (data.bene_fname ?? "")
            cell.pricelbl.text = (data.tlt_pkr ?? "") + " " + (data.curr ?? "")
            cell.stationlbl.text = data.station_city ?? ""
            
            
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = SearchedData!.data![indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TransactionDetailsViewController") as! TransactionDetailsViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
       
        
        vc.title_gbp = data.tlt_gbp ?? ""
        vc.charges = data.tcharges ?? ""
        vc.trade = data.tlt_pkr ?? ""
        vc.posttocm = data.trans ?? ""
        vc.rcvId = data.rcv_id ?? ""
        
        self.present(vc, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCollectionView.frame.width, height: 200)
    }
}
