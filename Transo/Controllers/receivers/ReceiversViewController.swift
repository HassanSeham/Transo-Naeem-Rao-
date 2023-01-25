//
//  ReceiversViewController.swift
//  Transo
//
//  Created by mac on 08/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
class ReceiversViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SearchtTextField: UITextField!
    @IBOutlet var BtnWidth: NSLayoutConstraint!
    @IBOutlet var Btnheight: NSLayoutConstraint!
    @IBOutlet var MyCollectionView: UICollectionView!
    var benificiary : Benificiary_Base?
    var SearchedData : Benificiary_Base?
    var hide = true
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchtTextField.delegate = self
        if hide == false
        {
            Btnheight.constant = 50
            BtnWidth.constant = 50
        }else{
            Btnheight.constant = 0
            BtnWidth.constant = 0
        }
        
//        KRProgressHUD.show(withMessage: "Loading...", completion: nil)
       
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        KRProgressHUD.show(withMessage: "Loading...", completion: nil)
        getBenificiaryList()
    }
    @IBAction func AddAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UpdateReceiverVC") as! UpdateReceiverVC
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        vc.add = true
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func BankAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SendMoneyViewController") as! SendMoneyViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
       
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func EditAction(_ sender: UIButton) {
        showAlertAction(title: "Update", message: "Are you sure to update?", tag: sender.tag)
    }
    @IBAction func BackAction(_ sender: UIButton) {
        hide = true
        self.dismiss(animated: true, completion: nil)
    }
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let searchText = SearchtTextField.text! + string
        
        if benificiary != nil{
            if benificiary!.data!.count > 0{
        SearchedData!.data = benificiary!.data!.filter({ value -> Bool in
            
            return (value.pname!.lowercased().contains(searchText.lowercased()) || value.lname!.lowercased().contains(searchText.lowercased()))
        })
        print("searched Result : \(SearchedData!.data!.count)")
           print(searchText)
                print(string)
                
                if searchText.count == 1 && string == ""{
                    SearchedData = benificiary
                }
            }
        
        }
        
        
        MyCollectionView.reloadData()
        return true
    }
    func getBenificiaryList() {
        let url:String = URLs.get_benificiary_list
        print(url)
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Benificiary_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        benificiary = decodedata
                        SearchedData = decodedata
                        KRProgressHUD.dismiss()
                        MyCollectionView.reloadData()
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
    func showAlertAction(title: String, message: String,tag : Int){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Update", style: UIAlertAction.Style.default, handler: {(action:UIAlertAction!) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "UpdateReceiverVC") as! UpdateReceiverVC
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            
            vc.data = self.benificiary!.data![tag]
            self.present(vc, animated: true, completion: nil)
            print("Action")
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
extension ReceiversViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if SearchedData != nil{
            return SearchedData!.data!.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ReceiversCollectionViewCell
        if benificiary != nil{
            let data = SearchedData!.data![indexPath.row]
            cell.EditBtn.tag = indexPath.row
            cell.accountlbl.text = data.bank_ac ?? ""
            cell.bankBtn.setTitle((data.ptype ?? ""), for: .normal)
            
//             (data.paddress ?? "") + "," + (data.pstate ?? "")
            
            let branch = data.branch ?? ""
            let address = (data.paddress ?? "")
            let city = data.city ?? ""
            let state = data.pstate ?? ""
            var fullAdd = ""
            if address != ""{
                fullAdd.append(address)
                fullAdd.append(",")
            }
            if city != ""{
                fullAdd.append(city)
                fullAdd.append(",")
            }
            if state != ""{
                fullAdd.append(state)
            }
            cell.addresslbl.text = branch
            if branch == ""{
            cell.addresslbl.text = fullAdd
            }
            cell.namelbl.text = ((data.pname ?? "") + " " + (data.lname ?? ""))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MyCollectionView.frame.width, height: 140)
    
}
}
