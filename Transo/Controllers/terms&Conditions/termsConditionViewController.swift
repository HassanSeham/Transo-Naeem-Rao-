//
//  termsConditionViewController.swift
//  Transo
//
//  Created by mac on 08/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
class termsConditionViewController: UIViewController {

    @IBOutlet var HtmlTextView: UITextView!
    var terms : terms_Base?
    override func viewDidLoad() {
        super.viewDidLoad()
        KRProgressHUD.show(withMessage: "Loading....", completion: nil)
        getTermsConditions()
        // Do any additional setup after loading the view.
    }
    func getTermsConditions() {
        let url:String = URLs.terms
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
            (response) in
            switch response.result
            {
            case .success:
                do{

                    let decodedata = try JSONDecoder().decode(terms_Base.self, from: response.data!)

                    let msgCode = decodedata.msg_code ?? ""
                    let metaString = decodedata.response ?? ""
                    if metaString == "success" || msgCode == "2000"
                    {
                        let HtmlText = decodedata.data![0].pdetail ?? ""
                        terms = decodedata
                        HtmlTextView.attributedText = HtmlText.htmlToAttributedString
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

}
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
