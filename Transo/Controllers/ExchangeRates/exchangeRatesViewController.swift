//
//  exchangeRatesViewController.swift
//  Transo
//
//  Created by mac on 08/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
class exchangeRatesViewController: UIViewController {

    @IBOutlet var myCollectionView: UICollectionView!
    
    var rates : TodaysRate_Base?
    override func viewDidLoad() {
        super.viewDidLoad()
        KRProgressHUD.show(withMessage: "Loading...", completion: nil)
        FetchTodaysRate()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func FetchTodaysRate() {
        let url:String = URLs.Today_Rate
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(TodaysRate_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        rates = decodedata
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
extension exchangeRatesViewController : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if rates != nil{
            return rates!.data!.count
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ExchangeRatesCollectionViewCell
        if rates != nil{
            let data = rates!.data![indexPath.row]
            cell.Countrylbl.text = data.company ?? ""
            cell.Ratelbl.text = "Rate : " + data.cust_rate!
            cell.chargelbl.text = "Charge : " + "\(data.ad_charges!)"
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCollectionView.frame.width, height: 90)
    }
    
}
