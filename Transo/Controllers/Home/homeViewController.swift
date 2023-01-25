//
//  homeViewController.swift
//  Transo
//
//  Created by mac on 08/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import CLabsImageSlider
import KRProgressHUD
import Alamofire
class homeViewController: UIViewController,imageSliderDelegate,UIGestureRecognizerDelegate {
    
    
    
    @IBOutlet var MyCollectionView: UICollectionView!
    @IBOutlet var PageControl: UIPageControl!
    @IBOutlet var imgSlider: CLabsImageSlider!
    
    var banners : Banners_Base?
    var rates : TodaysRate_Base?
    var indx = 0
    var localImages = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(false, forKey: "isLogOut")
        if let temp = UserDefaults.standard.value(forKey: "LoginUser") as? [String:String]{
        sender_id = temp["id"]!
        }
        KRProgressHUD.show(withMessage: "Loading...", completion: nil)
        let swipedLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleswipleft))
        swipedLeft.delegate = self
        swipedLeft.direction = .left
        imgSlider.addGestureRecognizer(swipedLeft)
        
        let swipedRight = UISwipeGestureRecognizer(target: self, action: #selector(handleswipRight))
        swipedRight.delegate = self
        swipedRight.direction = .right
        imgSlider.addGestureRecognizer(swipedRight)
        
        imgSlider.sliderDelegate = self
        
        PageControl.numberOfPages = localImages.count
        FetchTodaysRate()
        FetchBanners()
        
    }
    
    
    func didMovedToIndex(index: Int) {
        indx = self.imgSlider.currentIndex
        if indx > localImages.count{
            self.imgSlider.currentIndex = 0
        }
        indx = self.imgSlider.currentIndex
        
        PageControl.currentPage = indx
        PageControl.bringSubviewToFront(self.imgSlider)
    }
    
    @objc func handleswipleft(gesture: UISwipeGestureRecognizer) -> Void{
        if indx < 1{
            indx = 0
        }
        else{
            indx -= 1
        }
        
        
    }
    @objc func handleswipRight(gesture: UISwipeGestureRecognizer) -> Void{
        indx += 1
        if indx > localImages.count{
            indx = 0
        }
        
    }
    
    
    @IBAction func Ledger(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LedgerViewController") as! LedgerViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
       
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func SendMoneyAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ReceiversViewController") as! ReceiversViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        vc.hide = false
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func ExchangeBtnAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "exchangeRatesViewController") as! exchangeRatesViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func ProfileAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    func FetchBanners() {
        let url:String = URLs.Banners
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(Banners_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        banners = decodedata
                       
                        if banners != nil && localImages.count == 0
                        {
                            
                            
                            
                            localImages = [String]()
                            for ban in banners!.data!{
                                print(ban.image_url)
                                let img = ((ban.image_url ?? "") + ban.banner_image!)
                                localImages.append(img)
                            }
                            
                            PageControl.numberOfPages = localImages.count
                            imgSlider.setUpView(imageSource: .Url(imageArray: localImages, placeHolderImage: #imageLiteral(resourceName: "WhatsApp Image 2021-05-06 at 8.41.48 PM")),slideType: .Automatic(timeIntervalinSeconds: 5),isArrowBtnEnabled: false)

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
    
}
extension homeViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if rates != nil{
            return rates!.data!.count
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        if rates != nil{
            let data = rates!.data![indexPath.row]
            cell.Countrylbl.text = data.company ?? ""
            cell.Ratelbl.text = "Rate : " + data.cust_rate!
            cell.chargelbl.text = "Charge : " + "\(data.ad_charges!)"
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MyCollectionView.frame.width, height: 90)
    }
   
}
