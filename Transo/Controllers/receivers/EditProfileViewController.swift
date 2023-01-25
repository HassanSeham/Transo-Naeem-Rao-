//
//  EditProfileViewController.swift
//  Transo
//
//  Created by mac on 23/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import UIKit
import Alamofire
import KRProgressHUD
import SDWebImage
class EditProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var UserImgae2: UIImageView!
    @IBOutlet var UserImgae1: UIImageView!
    @IBOutlet var UserImage: UIImageView!
    @IBOutlet var fnamelbl: UITextField!
    @IBOutlet var mnamelbl: UITextField!
    @IBOutlet var lnamelbl: UITextField!
    @IBOutlet var passwordlbl: UITextField!
    @IBOutlet var doblbl: UILabel!
    @IBOutlet var genderlbl: UITextField!
    @IBOutlet var citylbl: UITextField!
    @IBOutlet var occupationlbl: UITextField!
    @IBOutlet var employerlbl: UITextField!
    @IBOutlet var postallbl: UITextField!
    @IBOutlet var addresslbl: UITextField!
    @IBOutlet var address2lbl: UITextField!
    @IBOutlet var countrylbl: UITextField!
    @IBOutlet var pasportlbl: UITextField!
    @IBOutlet var nationalitylbl: UITextField!
    @IBOutlet var phonelbl: UITextField!
    @IBOutlet var mobilelbl: UITextField!
    @IBOutlet var faxlbl: UITextField!
    @IBOutlet var emaillbl: UITextField!
    @IBOutlet var sourcelbl: UITextField!
    @IBOutlet var internalidreflbl: UITextField!
    @IBOutlet var idreflbl: UITextField!
    @IBOutlet var dynamicidlbl: UITextField!
    
    
    
    var userprofileImageArray:[UIImage] = []
    let imagePicker = UIImagePickerController()
    
    
    var imgtag = -1
    
    @IBAction func imgpick1Act(_ sender: UIButton) {
        imgtag = sender.tag
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    @IBOutlet weak var DobTF: UILabel!
    
    @IBAction func DobTFAction(_ sender: UITextField) {
        item = 0
    }
    @IBAction func issues1action(_ sender: UITextField) {
        item = 1
    }
    @IBAction func expire1Action(_ sender: UITextField) {
        item = 2
    }
    @IBAction func txtDatePickeract(_ sender: UITextField) {
        print("123")
        item = 3
        
    }
    @IBAction func txtDatePickerexp2(_ sender: Any) {
        print("adf")
        item = 4
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showDatePicker()
        DobTFTF.delegate = self
        txtDatePicker.delegate = self
        
        let data = prof!.data![0]
        KRProgressHUD.show(withMessage: "Loading...", completion: nil)
        FetchProfile()
        // Do any additional setup after loading the view.
    }
  func FetchProfile(){
        //        let url:String = URLs.BASE_URL + "?auth=123456&route=utilities&method=get_sender&sender_id=10&snd_id=\(sender_id)"
                let url:String = URLs.BASE_URL + "?route=utilities&method=get_sender&sender_id=\(sender_id)&auth=123456"
                print(url)
                Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON{ [self]
                    (response) in
                    switch response.result
                    {
                    case .success:
                        do{

                            let decodedata = try JSONDecoder().decode(getUserProfile_Base.self, from: response.data!)

                            let msgCode = decodedata.msg_code ?? ""
                            let metaString = decodedata.response ?? ""
                            if metaString == "success" || msgCode == "2000"
                            {
                                prof = decodedata
                                let data = prof!.data![0]
                                fnamelbl.text = data.fname ?? ""
                                lnamelbl.text = data.lname ?? ""
                                mnamelbl.text = data.mname ?? ""
                                passwordlbl.text = data.user_pass ?? ""
                                doblbl.text = data.dob ?? ""
                                genderlbl.text = data.gender ?? ""
                                citylbl.text = data.city ?? ""
                                occupationlbl.text = data.occupation ?? ""
                                employerlbl.text = data.emp_detail ?? ""
                                postallbl.text = data.pob ?? ""
                                addresslbl.text = data.address1 ?? ""
                                address2lbl.text = data.address2 ?? ""
                                countrylbl.text = data.county ?? ""
                                postallbl.text = data.zip ?? ""
                               
                                
                                nationalitylbl.text = data.nationality ?? ""
                                phonelbl.text = data.phone ?? ""
                                mobilelbl.text = data.mobile ?? ""
                                faxlbl.text = data.fax ?? ""
                                emaillbl.text = data.email ?? ""
                                sourcelbl.text = data.score ?? ""
                                internalidreflbl.text = data.id1 ?? ""
                                idreflbl.text = data.id2 ?? ""
                                dynamicidlbl.text = data.id ?? ""
                                let imgUrl = data.image_path ?? ""
                                UserImage.sd_setImage(with: URL(string: imgUrl + (data.id1_img1 ?? "")), placeholderImage: UIImage(named: "placeholder.jpg"))
                                UserImgae1.sd_setImage(with: URL(string: imgUrl + (data.id2_img1 ?? "")), placeholderImage: UIImage(named: "placeholder.jpg"))
                                UserImgae2.sd_setImage(with: URL(string:  imgUrl + (data.id3_img3 ?? "")), placeholderImage: UIImage(named: "placeholder.jpg"))
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
                            HAlert.ShowBoldToast(VC: self, msg: "Server Error")
                            print(err)
                        }
                        break
                    default:
                        KRProgressHUD.dismiss()
                        break
                    }
                }
            }
    
    @IBAction func txtDatePicker(_ sender: Any) {
    }
  
    @IBOutlet weak var DobTFTF: UITextField!
    @IBOutlet var issue1: UILabel!
    @IBOutlet var expire2: UILabel!
    @IBOutlet var isuuse3: UILabel!
    @IBOutlet var expire4: UILabel!
    let datePicker = UIDatePicker()
    var item = -1
    @IBOutlet var txtDatePicker1: UITextField!
    @IBOutlet var txtDatePicker2: UITextField!
    @IBOutlet var txtDatePicker3: UITextField!
    @IBOutlet var txtDatePicker4: UITextField!
    @IBOutlet var txtDatePicker: UITextField!
    @IBAction func ShowDateAction(_ sender: UIButton) {
        item = sender.tag
       showDatePicker()
    }
    func showDatePicker(){
      //Formate Date
      datePicker.datePickerMode = .date

     //ToolBar
     let toolbar = UIToolbar();
     toolbar.sizeToFit()
     let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

   toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        DobTFTF.inputView = datePicker
        DobTFTF.inputAccessoryView = toolbar
    txtDatePicker.inputAccessoryView = toolbar
    txtDatePicker.inputView = datePicker
        
        txtDatePicker1.inputAccessoryView = toolbar
        txtDatePicker1.inputView = datePicker
        
        txtDatePicker2.inputAccessoryView = toolbar
        txtDatePicker2.inputView = datePicker
        
        txtDatePicker3.inputAccessoryView = toolbar
        txtDatePicker3.inputView = datePicker
        
        txtDatePicker4.inputAccessoryView = toolbar
        txtDatePicker4.inputView = datePicker

   }
    @objc func cancelDatePicker(){
       self.view.endEditing(true)
     }
    @objc func donedatePicker(){

     let formatter = DateFormatter()
     formatter.dateFormat = "dd/MM/yyyy"
//     txtDatePicker.text = formatter.string(from: datePicker.date)
        if item == 0{
            DobTF.text = formatter.string(from: datePicker.date)
        }else if item == 1{
            issue1.text = formatter.string(from: datePicker.date)
        }else if item == 2{
            expire2.text = formatter.string(from: datePicker.date)
        }else if item == 3{
            isuuse3.text = formatter.string(from: datePicker.date)
        }else if item == 4{
            expire4.text = formatter.string(from: datePicker.date)
        }else if item == 5{
            
        }
       
     self.view.endEditing(true)
   }
    @IBAction func BackAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }


    
    @IBAction func updateAction(_ sender: UIButton) {
        KRProgressHUD.show(withMessage: "Loading...", completion: nil)
        dataRegister()
    }
    func dataRegister()
        {
            //*//with image//*//
            let parameter : Parameters = [
                "":""]
        let originalString = "https://quantumqsystems.com/money/api/?auth=123456&action=edit_user_update&sender_id=\(sender_id)&route=utilities&auth=123456&method=update_sender&ptype=Normal&user_login=&user_pass=\(passwordlbl.text!)&dob=01%2F01%2F1970&fname=\(fnamelbl.text!)&mname=\(mnamelbl.text!)&lname=\(lnamelbl.text!)&gender=\(genderlbl.text!)&cob=\(countrylbl.text!)&occupation=\(occupationlbl.text!)&emp_detail=\(employerlbl.text!)&emp_address=\(addresslbl.text!)&zip=\(postallbl.text!)&address2=\(address2lbl.text!)&address1=\(addresslbl.text!)&city=\(citylbl.text!)&county=\(countrylbl.text!)&passport_c=\(pasportlbl.text!)&nationality=\(countrylbl.text!)&phone=\(phonelbl.text!)&mobile=\(mobilelbl.text!)&fax=\(faxlbl.text!)&email=\(emaillbl.text!)&sof=&idf=&id1=brp_id_image&id1_value=sdfasdf&id1_issue=\(issue1.text!)&id1_expiry=\(expire2.text!)&id2_issue=\(isuuse3.text!)&id2_expiry=\(expire4.text!)"
        
        
//               var urlString = originalString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            
            var urlString = originalString.replacingOccurrences(of: " ", with: "")
               print(urlString)
        
//                [
//                    "auth":"123456",
//                    "action":"edit_user_update",
//                    "sender_id":"1",
//                    "route":"utilities",
//                    "method":"update_sender",
//                    "ptype":"Normal",
//                    "user_login":"",
//                    "user_pass":"",
//                    "dob":"12 12 2000",
//                    "fname":"Naeem",
//                    "mname":"Rao",
//                    "lname":"Mastani",
//                    "gender":"Male",
//                    "cob":"Pakistan",
//                    "occupation":"JOB",
//                    "emp_detail":"xyz",
//                    "emp_address":"model town",
//                    "zip":"51310",
//                    "address2":"model town",
//                    "city":"sialkot",
//                    "county":"Victoria",
//                    "passport_c":"Australia",
//                    "nationality":"United",
//                    "phone":"12321",
//                    "mobile":"3333333",
//                    "fax":"",
//                    "email":"naeem@gmail.com",
//                    "sof":"",
//                    "idf":"",
//                    "id1":"brp_id_image",
//                    "id1_value":"sdfasdf",
//                    "id1_issue":"10 10 2009",
//                    "id1_expiry":"10 10 2010"
//
//                ]
       
            //print(parameter)
            //yhn pickedImage jo use kia ha wo UIImage tyoe ka ak variable the jis mn browsw hui v Image save ki hs
        var x = 0
        var y = 0
        var z = 0
        var imageData3 : Data?
        var imageData2 : Data?
        var imageData : Data?
        if userprofileImageArray.count > 0
        {
            z = 1
            var pickedImage = userprofileImageArray[0]
        

      
         imageData = pickedImage.jpegData(compressionQuality: 0.4)
         imageData2 = imageData
         imageData3 = imageData
        if userprofileImageArray.count > 1{
            pickedImage = userprofileImageArray[1]
            x = 1
            imageData2 = pickedImage.jpegData(compressionQuality: 0.4)
        }
        if userprofileImageArray.count > 2{
            pickedImage = userprofileImageArray[2]
            y = 1
            imageData3 = pickedImage.jpegData(compressionQuality: 0.4)
        }}
            //print(imageData!)
        
            Alamofire.upload(multipartFormData:
                { (multiPart) in
                //nichy wli line main "withname" jo ha us m Ap ny Api mn jis name sy Image wala column ha us Column ka name Dana ha
                    
                    if z == 1{
                    
                    multiPart.append(imageData!, withName: "img1", fileName: "image1.png", mimeType: "image/png")
                    }
                    if x == 1{
                        multiPart.append(imageData2!, withName: "img2", fileName: "image2.png", mimeType: "image/png")
                    }
                    if y == 1{
                        multiPart.append(imageData3!, withName: "img3", fileName: "image3.png", mimeType: "image/png")
                    }
                    for (key , value) in parameter
                    {
                        multiPart.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
                        
                    }
                }, usingThreshold: UInt64.init(), to: urlString , method: .post, headers: nil) {
                (result) in
                print(result)
                    KRProgressHUD.dismiss()
                switch result
                {
                    case .success(let upload, _, _):
                        upload.responseJSON{ (response) in
                            print("good")
                            print(response.result.value as Any)
                            if let dic = response.result.value as? [String:Any]{
                            let msgDes = dic["msg_description"] as? String ?? ""
                                
                            let msgCode = dic["msg_code"] as? Int ?? 0
                                if msgDes == "success" ||  msgCode == 1000{
                                    HAlert.ShowBoldToast(VC: self, msg: "updated Sucessfully!")
                                }else{
                                    HAlert.ShowBoldToast(VC: self, msg: msgDes)
                                }
                                
//                                print(dic["response"])
//                                print(dic["msg_description"])
//                                print(dic["data"])
//                                print(dic["msg_code"])
                            }
                            
                            
                        }
                    case .failure(let error):
                        print(error)
                }
            }

        }
}
extension EditProfileViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    func openCamera()
       {
         if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
         {
           imagePicker.sourceType = UIImagePickerController.SourceType.camera
           imagePicker.allowsEditing = true
           self.present(imagePicker, animated: true, completion: nil)
         }
         else
         {
           let alert = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           self.present(alert, animated: true, completion: nil)
         }
       }
       func openGallary()
       {
         imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
         imagePicker.allowsEditing = true
         self.present(imagePicker, animated: true, completion: nil)
       }
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
         // The info dictionary may contain multiple representations of the image. You want to use the original.
         guard let selectedImage = info[.originalImage] as? UIImage else {
           fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
         }
        
        if imgtag == 0{
        
         UserImage.contentMode = .scaleAspectFill
         UserImage.image = selectedImage
         userprofileImageArray.append(selectedImage)
        }else if imgtag == 1{
            
            UserImgae1.contentMode = .scaleAspectFill
            UserImgae1.image = selectedImage
            userprofileImageArray.append(selectedImage)
           }else if imgtag == 2{
            
            UserImgae2.contentMode = .scaleAspectFill
            UserImgae2.image = selectedImage
            userprofileImageArray.append(selectedImage)
           }
     
         dismiss(animated: true, completion: nil)
       }//End Image picker
     }
