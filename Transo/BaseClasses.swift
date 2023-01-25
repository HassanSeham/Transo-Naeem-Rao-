//
//  BaseClasses.swift
//  Transo
//
//  Created by mac on 08/05/2021.
//  Copyright © 2021 Apple. All rights reserved.
//

import Foundation
import UIKit

struct TodaysRate_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let company : String?
        let cust_rate : String?
        let ad_charges : String?

        enum CodingKeys: String, CodingKey {

            case company = "company"
            case cust_rate = "cust_rate"
            case ad_charges = "ad_charges"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            company = try values.decodeIfPresent(String.self, forKey: .company)
            cust_rate = try values.decodeIfPresent(String.self, forKey: .cust_rate)
            ad_charges = try values.decodeIfPresent(String.self, forKey: .ad_charges)
        }

    }

}

struct banksList_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let id : String?
        let bank_name : String?
        let bank_address : String?
        let pactive : String?
        let profit : String?
        let bank_id : String?
        let bank_code : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case bank_name = "bank_name"
            case bank_address = "bank_address"
            case pactive = "pactive"
            case profit = "profit"
            case bank_id = "bank_id"
            case bank_code = "bank_code"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            bank_name = try values.decodeIfPresent(String.self, forKey: .bank_name)
            bank_address = try values.decodeIfPresent(String.self, forKey: .bank_address)
            pactive = try values.decodeIfPresent(String.self, forKey: .pactive)
            profit = try values.decodeIfPresent(String.self, forKey: .profit)
            bank_id = try values.decodeIfPresent(String.self, forKey: .bank_id)
            bank_code = try values.decodeIfPresent(String.self, forKey: .bank_code)
        }

    }

}

struct addReceiver_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : String?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent(String.self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

}

struct getUserProfile_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let id : String?
        let snd_id : String?
        let agt_id : String?
        let fname : String?
        let mname : String?
        let lname : String?
        let address1 : String?
        let address2 : String?
        let country : String?
        let city : String?
        let zip : String?
        let phone : String?
        let mobile : String?
        let fax : String?
        let email : String?
        let dob : String?
        let county : String?
        let id1 : String?
        let id1_value : String?
        let id1_issue : String?
        let id1_expiry : String?
        let id1_img1 : String?
        let id2 : String?
        let id2_value : String?
        let id2_issue : String?
        let id2_expiry : String?
        let id2_img1 : String?
        let amt_send : String?
        let cust_balance : String?
        let old_id : String?
        let sub_agt_id : String?
        let id3 : String?
        let id3_value : String?
        let id3_issue : String?
        let id3_expiry : String?
        let id3_img : String?
        let tf_id_type : String?
        let tf_id_value : String?
        let tf_id_issue : String?
        let tf_id_expire : String?
        let snd_ocupation : String?
        let snd_ssn : String?
        let snd_fund : String?
        let door_no : String?
        let sof_declaration : String?
        let country_code : String?
        let country_phone_code : String?
        let nationality_code : String?
        let sof_code : String?
        let pur_of_txn : String?
        let xm_id1_type : String?
        let xm_id1_no : String?
        let xm_id1_issueby : String?
        let xm_id1_issueat : String?
        let xm_id1_issue_country : String?
        let xm_id1_issue_date : String?
        let xm_id1_expiry_date : String?
        let xm_id1_img1 : String?
        let xm_id1_img2 : String?
        let xm_id2_type : String?
        let xm_id2_no : String?
        let xm_id2_issueby : String?
        let xm_id2_issueat : String?
        let xm_id2_issue_country : String?
        let xm_id2_issue_date : String?
        let xm_id2_expiry_date : String?
        let xm_id2_img1 : String?
        let xm_id2_img2 : String?
        let xm_cust_id : String?
        let xm_active : String?
        let id4_img : String?
        let gender : String?
        let pob : String?
        let pstate : String?
        let user_login : String?
        let user_pass : String?
        let front_enable : String?
        let pshow : String?
        let occupation : String?
        let id_other : String?
        let id_issuer : String?
        let reset_code : String?
        let reset_date : String?
        let img1 : String?
        let blocked : String?
        let sof : String?
        let cob : String?
        let nationality : String?
        let creditsafe_status : String?
        let ptype : String?
        let created_date : String?
        let ofac_status : String?
        let ofac_msg : String?
        let ofac_clear : String?
        let sar_reported : String?
        let ofac_list_counter : String?
        let ofac_action_date : String?
        let idf : String?
        let img_bstate : String?
        let img_bstate1 : String?
        let img_bstate2 : String?
        let img_pay_slip : String?
        let img_pay_slip1 : String?
        let img_pay_slip2 : String?
        let img_uti_bill : String?
        let dec1_img : String?
        let emp_detail : String?
        let emp_address : String?
        let co_image : String?
        let id3b_img3 : String?
        let id1b_img1 : String?
        let sys_register_time_stamp : String?
        let country_issue : String?
        let m_name : String?
        let id3_img3 : String?
        let authenticationID : String?
        let score : String?
        let bandText : String?
        let verified : String?
        let verified_date : String?
        let newsletter : String?
        let sar_c_status : String?
        let pep : String?
        let image_path : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case snd_id = "snd_id"
            case agt_id = "agt_id"
            case fname = "fname"
            case mname = "mname"
            case lname = "lname"
            case address1 = "address1"
            case address2 = "address2"
            case country = "country"
            case city = "city"
            case zip = "zip"
            case phone = "phone"
            case mobile = "mobile"
            case fax = "fax"
            case email = "email"
            case dob = "dob"
            case county = "county"
            case id1 = "id1"
            case id1_value = "id1_value"
            case id1_issue = "id1_issue"
            case id1_expiry = "id1_expiry"
            case id1_img1 = "id1_img1"
            case id2 = "id2"
            case id2_value = "id2_value"
            case id2_issue = "id2_issue"
            case id2_expiry = "id2_expiry"
            case id2_img1 = "id2_img1"
            case amt_send = "amt_send"
            case cust_balance = "cust_balance"
            case old_id = "old_id"
            case sub_agt_id = "sub_agt_id"
            case id3 = "id3"
            case id3_value = "id3_value"
            case id3_issue = "id3_issue"
            case id3_expiry = "id3_expiry"
            case id3_img = "id3_img"
            case tf_id_type = "tf_id_type"
            case tf_id_value = "tf_id_value"
            case tf_id_issue = "tf_id_issue"
            case tf_id_expire = "tf_id_expire"
            case snd_ocupation = "snd_ocupation"
            case snd_ssn = "snd_ssn"
            case snd_fund = "snd_fund"
            case door_no = "door_no"
            case sof_declaration = "sof_declaration"
            case country_code = "country_code"
            case country_phone_code = "country_phone_code"
            case nationality_code = "nationality_code"
            case sof_code = "sof_code"
            case pur_of_txn = "pur_of_txn"
            case xm_id1_type = "xm_id1_type"
            case xm_id1_no = "xm_id1_no"
            case xm_id1_issueby = "xm_id1_issueby"
            case xm_id1_issueat = "xm_id1_issueat"
            case xm_id1_issue_country = "xm_id1_issue_country"
            case xm_id1_issue_date = "xm_id1_issue_date"
            case xm_id1_expiry_date = "xm_id1_expiry_date"
            case xm_id1_img1 = "xm_id1_img1"
            case xm_id1_img2 = "xm_id1_img2"
            case xm_id2_type = "xm_id2_type"
            case xm_id2_no = "xm_id2_no"
            case xm_id2_issueby = "xm_id2_issueby"
            case xm_id2_issueat = "xm_id2_issueat"
            case xm_id2_issue_country = "xm_id2_issue_country"
            case xm_id2_issue_date = "xm_id2_issue_date"
            case xm_id2_expiry_date = "xm_id2_expiry_date"
            case xm_id2_img1 = "xm_id2_img1"
            case xm_id2_img2 = "xm_id2_img2"
            case xm_cust_id = "xm_cust_id"
            case xm_active = "xm_active"
            case id4_img = "id4_img"
            case gender = "gender"
            case pob = "pob"
            case pstate = "pstate"
            case user_login = "user_login"
            case user_pass = "user_pass"
            case front_enable = "front_enable"
            case pshow = "pshow"
            case occupation = "occupation"
            case id_other = "id_other"
            case id_issuer = "id_issuer"
            case reset_code = "reset_code"
            case reset_date = "reset_date"
            case img1 = "img1"
            case blocked = "blocked"
            case sof = "sof"
            case cob = "cob"
            case nationality = "nationality"
            case creditsafe_status = "creditsafe_status"
            case ptype = "ptype"
            case created_date = "created_date"
            case ofac_status = "ofac_status"
            case ofac_msg = "ofac_msg"
            case ofac_clear = "ofac_clear"
            case sar_reported = "sar_reported"
            case ofac_list_counter = "ofac_list_counter"
            case ofac_action_date = "ofac_action_date"
            case idf = "idf"
            case img_bstate = "img_bstate"
            case img_bstate1 = "img_bstate1"
            case img_bstate2 = "img_bstate2"
            case img_pay_slip = "img_pay_slip"
            case img_pay_slip1 = "img_pay_slip1"
            case img_pay_slip2 = "img_pay_slip2"
            case img_uti_bill = "img_uti_bill"
            case dec1_img = "dec1_img"
            case emp_detail = "emp_detail"
            case emp_address = "emp_address"
            case co_image = "co_image"
            case id3b_img3 = "id3b_img3"
            case id1b_img1 = "id1b_img1"
            case sys_register_time_stamp = "sys_register_time_stamp"
            case country_issue = "country_issue"
            case m_name = "m_name"
            case id3_img3 = "id3_img3"
            case authenticationID = "AuthenticationID"
            case score = "Score"
            case bandText = "BandText"
            case verified = "verified"
            case verified_date = "verified_date"
            case newsletter = "newsletter"
            case sar_c_status = "sar_c_status"
            case pep = "pep"
            case image_path = "image_path"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            snd_id = try values.decodeIfPresent(String.self, forKey: .snd_id)
            agt_id = try values.decodeIfPresent(String.self, forKey: .agt_id)
            fname = try values.decodeIfPresent(String.self, forKey: .fname)
            mname = try values.decodeIfPresent(String.self, forKey: .mname)
            lname = try values.decodeIfPresent(String.self, forKey: .lname)
            address1 = try values.decodeIfPresent(String.self, forKey: .address1)
            address2 = try values.decodeIfPresent(String.self, forKey: .address2)
            country = try values.decodeIfPresent(String.self, forKey: .country)
            city = try values.decodeIfPresent(String.self, forKey: .city)
            zip = try values.decodeIfPresent(String.self, forKey: .zip)
            phone = try values.decodeIfPresent(String.self, forKey: .phone)
            mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
            fax = try values.decodeIfPresent(String.self, forKey: .fax)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            dob = try values.decodeIfPresent(String.self, forKey: .dob)
            county = try values.decodeIfPresent(String.self, forKey: .county)
            id1 = try values.decodeIfPresent(String.self, forKey: .id1)
            id1_value = try values.decodeIfPresent(String.self, forKey: .id1_value)
            id1_issue = try values.decodeIfPresent(String.self, forKey: .id1_issue)
            id1_expiry = try values.decodeIfPresent(String.self, forKey: .id1_expiry)
            id1_img1 = try values.decodeIfPresent(String.self, forKey: .id1_img1)
            id2 = try values.decodeIfPresent(String.self, forKey: .id2)
            id2_value = try values.decodeIfPresent(String.self, forKey: .id2_value)
            id2_issue = try values.decodeIfPresent(String.self, forKey: .id2_issue)
            id2_expiry = try values.decodeIfPresent(String.self, forKey: .id2_expiry)
            id2_img1 = try values.decodeIfPresent(String.self, forKey: .id2_img1)
            amt_send = try values.decodeIfPresent(String.self, forKey: .amt_send)
            cust_balance = try values.decodeIfPresent(String.self, forKey: .cust_balance)
            old_id = try values.decodeIfPresent(String.self, forKey: .old_id)
            sub_agt_id = try values.decodeIfPresent(String.self, forKey: .sub_agt_id)
            id3 = try values.decodeIfPresent(String.self, forKey: .id3)
            id3_value = try values.decodeIfPresent(String.self, forKey: .id3_value)
            id3_issue = try values.decodeIfPresent(String.self, forKey: .id3_issue)
            id3_expiry = try values.decodeIfPresent(String.self, forKey: .id3_expiry)
            id3_img = try values.decodeIfPresent(String.self, forKey: .id3_img)
            tf_id_type = try values.decodeIfPresent(String.self, forKey: .tf_id_type)
            tf_id_value = try values.decodeIfPresent(String.self, forKey: .tf_id_value)
            tf_id_issue = try values.decodeIfPresent(String.self, forKey: .tf_id_issue)
            tf_id_expire = try values.decodeIfPresent(String.self, forKey: .tf_id_expire)
            snd_ocupation = try values.decodeIfPresent(String.self, forKey: .snd_ocupation)
            snd_ssn = try values.decodeIfPresent(String.self, forKey: .snd_ssn)
            snd_fund = try values.decodeIfPresent(String.self, forKey: .snd_fund)
            door_no = try values.decodeIfPresent(String.self, forKey: .door_no)
            sof_declaration = try values.decodeIfPresent(String.self, forKey: .sof_declaration)
            country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
            country_phone_code = try values.decodeIfPresent(String.self, forKey: .country_phone_code)
            nationality_code = try values.decodeIfPresent(String.self, forKey: .nationality_code)
            sof_code = try values.decodeIfPresent(String.self, forKey: .sof_code)
            pur_of_txn = try values.decodeIfPresent(String.self, forKey: .pur_of_txn)
            xm_id1_type = try values.decodeIfPresent(String.self, forKey: .xm_id1_type)
            xm_id1_no = try values.decodeIfPresent(String.self, forKey: .xm_id1_no)
            xm_id1_issueby = try values.decodeIfPresent(String.self, forKey: .xm_id1_issueby)
            xm_id1_issueat = try values.decodeIfPresent(String.self, forKey: .xm_id1_issueat)
            xm_id1_issue_country = try values.decodeIfPresent(String.self, forKey: .xm_id1_issue_country)
            xm_id1_issue_date = try values.decodeIfPresent(String.self, forKey: .xm_id1_issue_date)
            xm_id1_expiry_date = try values.decodeIfPresent(String.self, forKey: .xm_id1_expiry_date)
            xm_id1_img1 = try values.decodeIfPresent(String.self, forKey: .xm_id1_img1)
            xm_id1_img2 = try values.decodeIfPresent(String.self, forKey: .xm_id1_img2)
            xm_id2_type = try values.decodeIfPresent(String.self, forKey: .xm_id2_type)
            xm_id2_no = try values.decodeIfPresent(String.self, forKey: .xm_id2_no)
            xm_id2_issueby = try values.decodeIfPresent(String.self, forKey: .xm_id2_issueby)
            xm_id2_issueat = try values.decodeIfPresent(String.self, forKey: .xm_id2_issueat)
            xm_id2_issue_country = try values.decodeIfPresent(String.self, forKey: .xm_id2_issue_country)
            xm_id2_issue_date = try values.decodeIfPresent(String.self, forKey: .xm_id2_issue_date)
            xm_id2_expiry_date = try values.decodeIfPresent(String.self, forKey: .xm_id2_expiry_date)
            xm_id2_img1 = try values.decodeIfPresent(String.self, forKey: .xm_id2_img1)
            xm_id2_img2 = try values.decodeIfPresent(String.self, forKey: .xm_id2_img2)
            xm_cust_id = try values.decodeIfPresent(String.self, forKey: .xm_cust_id)
            xm_active = try values.decodeIfPresent(String.self, forKey: .xm_active)
            id4_img = try values.decodeIfPresent(String.self, forKey: .id4_img)
            gender = try values.decodeIfPresent(String.self, forKey: .gender)
            pob = try values.decodeIfPresent(String.self, forKey: .pob)
            pstate = try values.decodeIfPresent(String.self, forKey: .pstate)
            user_login = try values.decodeIfPresent(String.self, forKey: .user_login)
            user_pass = try values.decodeIfPresent(String.self, forKey: .user_pass)
            front_enable = try values.decodeIfPresent(String.self, forKey: .front_enable)
            pshow = try values.decodeIfPresent(String.self, forKey: .pshow)
            occupation = try values.decodeIfPresent(String.self, forKey: .occupation)
            id_other = try values.decodeIfPresent(String.self, forKey: .id_other)
            id_issuer = try values.decodeIfPresent(String.self, forKey: .id_issuer)
            reset_code = try values.decodeIfPresent(String.self, forKey: .reset_code)
            reset_date = try values.decodeIfPresent(String.self, forKey: .reset_date)
            img1 = try values.decodeIfPresent(String.self, forKey: .img1)
            blocked = try values.decodeIfPresent(String.self, forKey: .blocked)
            sof = try values.decodeIfPresent(String.self, forKey: .sof)
            cob = try values.decodeIfPresent(String.self, forKey: .cob)
            nationality = try values.decodeIfPresent(String.self, forKey: .nationality)
            creditsafe_status = try values.decodeIfPresent(String.self, forKey: .creditsafe_status)
            ptype = try values.decodeIfPresent(String.self, forKey: .ptype)
            created_date = try values.decodeIfPresent(String.self, forKey: .created_date)
            ofac_status = try values.decodeIfPresent(String.self, forKey: .ofac_status)
            ofac_msg = try values.decodeIfPresent(String.self, forKey: .ofac_msg)
            ofac_clear = try values.decodeIfPresent(String.self, forKey: .ofac_clear)
            sar_reported = try values.decodeIfPresent(String.self, forKey: .sar_reported)
            ofac_list_counter = try values.decodeIfPresent(String.self, forKey: .ofac_list_counter)
            ofac_action_date = try values.decodeIfPresent(String.self, forKey: .ofac_action_date)
            idf = try values.decodeIfPresent(String.self, forKey: .idf)
            img_bstate = try values.decodeIfPresent(String.self, forKey: .img_bstate)
            img_bstate1 = try values.decodeIfPresent(String.self, forKey: .img_bstate1)
            img_bstate2 = try values.decodeIfPresent(String.self, forKey: .img_bstate2)
            img_pay_slip = try values.decodeIfPresent(String.self, forKey: .img_pay_slip)
            img_pay_slip1 = try values.decodeIfPresent(String.self, forKey: .img_pay_slip1)
            img_pay_slip2 = try values.decodeIfPresent(String.self, forKey: .img_pay_slip2)
            img_uti_bill = try values.decodeIfPresent(String.self, forKey: .img_uti_bill)
            dec1_img = try values.decodeIfPresent(String.self, forKey: .dec1_img)
            emp_detail = try values.decodeIfPresent(String.self, forKey: .emp_detail)
            emp_address = try values.decodeIfPresent(String.self, forKey: .emp_address)
            co_image = try values.decodeIfPresent(String.self, forKey: .co_image)
            id3b_img3 = try values.decodeIfPresent(String.self, forKey: .id3b_img3)
            id1b_img1 = try values.decodeIfPresent(String.self, forKey: .id1b_img1)
            sys_register_time_stamp = try values.decodeIfPresent(String.self, forKey: .sys_register_time_stamp)
            country_issue = try values.decodeIfPresent(String.self, forKey: .country_issue)
            m_name = try values.decodeIfPresent(String.self, forKey: .m_name)
            id3_img3 = try values.decodeIfPresent(String.self, forKey: .id3_img3)
            authenticationID = try values.decodeIfPresent(String.self, forKey: .authenticationID)
            score = try values.decodeIfPresent(String.self, forKey: .score)
            bandText = try values.decodeIfPresent(String.self, forKey: .bandText)
            verified = try values.decodeIfPresent(String.self, forKey: .verified)
            verified_date = try values.decodeIfPresent(String.self, forKey: .verified_date)
            newsletter = try values.decodeIfPresent(String.self, forKey: .newsletter)
            sar_c_status = try values.decodeIfPresent(String.self, forKey: .sar_c_status)
            pep = try values.decodeIfPresent(String.self, forKey: .pep)
            image_path = try values.decodeIfPresent(String.self, forKey: .image_path)
        }

    }

}

struct UPdateReceiver_msg_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : String?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent(String.self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

}

struct Banks_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let id : String?
        let bank_name : String?
        let bank_address : String?
        let pactive : String?
        let profit : String?
        let bank_id : String?
        let bank_code : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case bank_name = "bank_name"
            case bank_address = "bank_address"
            case pactive = "pactive"
            case profit = "profit"
            case bank_id = "bank_id"
            case bank_code = "bank_code"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            bank_name = try values.decodeIfPresent(String.self, forKey: .bank_name)
            bank_address = try values.decodeIfPresent(String.self, forKey: .bank_address)
            pactive = try values.decodeIfPresent(String.self, forKey: .pactive)
            profit = try values.decodeIfPresent(String.self, forKey: .profit)
            bank_id = try values.decodeIfPresent(String.self, forKey: .bank_id)
            bank_code = try values.decodeIfPresent(String.self, forKey: .bank_code)
        }

    }

}

struct Relations_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let id : String?
        let static_type : String?
        let text : String?
        let value : String?
        let status : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case static_type = "static_type"
            case text = "text"
            case value = "value"
            case status = "status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            static_type = try values.decodeIfPresent(String.self, forKey: .static_type)
            text = try values.decodeIfPresent(String.self, forKey: .text)
            value = try values.decodeIfPresent(String.self, forKey: .value)
            status = try values.decodeIfPresent(String.self, forKey: .status)
        }

    }

}

struct Countries_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let country_name : String?

        enum CodingKeys: String, CodingKey {

            case country_name = "country_name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            country_name = try values.decodeIfPresent(String.self, forKey: .country_name)
        }

    }

}

struct Login_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : Data?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let id : String?
        let user_pass : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case user_pass = "user_pass"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            user_pass = try values.decodeIfPresent(String.self, forKey: .user_pass)
        }

    }

}

struct Banners_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let id : String?
        let banner_date : String?
        let banner_image : String?
        let image_url : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case banner_date = "banner_date"
            case banner_image = "banner_image"
            case image_url = "image_url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            banner_date = try values.decodeIfPresent(String.self, forKey: .banner_date)
            banner_image = try values.decodeIfPresent(String.self, forKey: .banner_image)
            image_url = try values.decodeIfPresent(String.self, forKey: .image_url)
        }

    }

}

struct Prof_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let id : String?
        let snd_id : String?
        let agt_id : String?
        let fname : String?
        let mname : String?
        let lname : String?
        let address1 : String?
        let address2 : String?
        let country : String?
        let city : String?
        let zip : String?
        let phone : String?
        let mobile : String?
        let fax : String?
        let email : String?
        let dob : String?
        let county : String?
        let id1 : String?
        let id1_value : String?
        let id1_issue : String?
        let id1_expiry : String?
        let id1_img1 : String?
        let id2 : String?
        let id2_value : String?
        let id2_issue : String?
        let id2_expiry : String?
        let id2_img1 : String?
        let amt_send : String?
        let cust_balance : String?
        let old_id : String?
        let sub_agt_id : String?
        let id3 : String?
        let id3_value : String?
        let id3_issue : String?
        let id3_expiry : String?
        let id3_img : String?
        let tf_id_type : String?
        let tf_id_value : String?
        let tf_id_issue : String?
        let tf_id_expire : String?
        let snd_ocupation : String?
        let snd_ssn : String?
        let snd_fund : String?
        let door_no : String?
        let sof_declaration : String?
        let country_code : String?
        let country_phone_code : String?
        let nationality_code : String?
        let sof_code : String?
        let pur_of_txn : String?
        let xm_id1_type : String?
        let xm_id1_no : String?
        let xm_id1_issueby : String?
        let xm_id1_issueat : String?
        let xm_id1_issue_country : String?
        let xm_id1_issue_date : String?
        let xm_id1_expiry_date : String?
        let xm_id1_img1 : String?
        let xm_id1_img2 : String?
        let xm_id2_type : String?
        let xm_id2_no : String?
        let xm_id2_issueby : String?
        let xm_id2_issueat : String?
        let xm_id2_issue_country : String?
        let xm_id2_issue_date : String?
        let xm_id2_expiry_date : String?
        let xm_id2_img1 : String?
        let xm_id2_img2 : String?
        let xm_cust_id : String?
        let xm_active : String?
        let id4_img : String?
        let gender : String?
        let pob : String?
        let pstate : String?
        let user_login : String?
        let user_pass : String?
        let front_enable : String?
        let pshow : String?
        let occupation : String?
        let id_other : String?
        let id_issuer : String?
        let reset_code : String?
        let reset_date : String?
        let img1 : String?
        let blocked : String?
        let sof : String?
        let cob : String?
        let nationality : String?
        let creditsafe_status : String?
        let ptype : String?
        let created_date : String?
        let ofac_status : String?
        let ofac_msg : String?
        let ofac_clear : String?
        let sar_reported : String?
        let ofac_list_counter : String?
        let ofac_action_date : String?
        let idf : String?
        let img_bstate : String?
        let img_bstate1 : String?
        let img_bstate2 : String?
        let img_pay_slip : String?
        let img_pay_slip1 : String?
        let img_pay_slip2 : String?
        let img_uti_bill : String?
        let dec1_img : String?
        let emp_detail : String?
        let emp_address : String?
        let co_image : String?
        let id3b_img3 : String?
        let id1b_img1 : String?
        let sys_register_time_stamp : String?
        let country_issue : String?
        let m_name : String?
        let id3_img3 : String?
        let authenticationID : String?
        let score : String?
        let bandText : String?
        let verified : String?
        let verified_date : String?
        let newsletter : String?
        let sar_c_status : String?
        let pep : String?
        let image_path : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case snd_id = "snd_id"
            case agt_id = "agt_id"
            case fname = "fname"
            case mname = "mname"
            case lname = "lname"
            case address1 = "address1"
            case address2 = "address2"
            case country = "country"
            case city = "city"
            case zip = "zip"
            case phone = "phone"
            case mobile = "mobile"
            case fax = "fax"
            case email = "email"
            case dob = "dob"
            case county = "county"
            case id1 = "id1"
            case id1_value = "id1_value"
            case id1_issue = "id1_issue"
            case id1_expiry = "id1_expiry"
            case id1_img1 = "id1_img1"
            case id2 = "id2"
            case id2_value = "id2_value"
            case id2_issue = "id2_issue"
            case id2_expiry = "id2_expiry"
            case id2_img1 = "id2_img1"
            case amt_send = "amt_send"
            case cust_balance = "cust_balance"
            case old_id = "old_id"
            case sub_agt_id = "sub_agt_id"
            case id3 = "id3"
            case id3_value = "id3_value"
            case id3_issue = "id3_issue"
            case id3_expiry = "id3_expiry"
            case id3_img = "id3_img"
            case tf_id_type = "tf_id_type"
            case tf_id_value = "tf_id_value"
            case tf_id_issue = "tf_id_issue"
            case tf_id_expire = "tf_id_expire"
            case snd_ocupation = "snd_ocupation"
            case snd_ssn = "snd_ssn"
            case snd_fund = "snd_fund"
            case door_no = "door_no"
            case sof_declaration = "sof_declaration"
            case country_code = "country_code"
            case country_phone_code = "country_phone_code"
            case nationality_code = "nationality_code"
            case sof_code = "sof_code"
            case pur_of_txn = "pur_of_txn"
            case xm_id1_type = "xm_id1_type"
            case xm_id1_no = "xm_id1_no"
            case xm_id1_issueby = "xm_id1_issueby"
            case xm_id1_issueat = "xm_id1_issueat"
            case xm_id1_issue_country = "xm_id1_issue_country"
            case xm_id1_issue_date = "xm_id1_issue_date"
            case xm_id1_expiry_date = "xm_id1_expiry_date"
            case xm_id1_img1 = "xm_id1_img1"
            case xm_id1_img2 = "xm_id1_img2"
            case xm_id2_type = "xm_id2_type"
            case xm_id2_no = "xm_id2_no"
            case xm_id2_issueby = "xm_id2_issueby"
            case xm_id2_issueat = "xm_id2_issueat"
            case xm_id2_issue_country = "xm_id2_issue_country"
            case xm_id2_issue_date = "xm_id2_issue_date"
            case xm_id2_expiry_date = "xm_id2_expiry_date"
            case xm_id2_img1 = "xm_id2_img1"
            case xm_id2_img2 = "xm_id2_img2"
            case xm_cust_id = "xm_cust_id"
            case xm_active = "xm_active"
            case id4_img = "id4_img"
            case gender = "gender"
            case pob = "pob"
            case pstate = "pstate"
            case user_login = "user_login"
            case user_pass = "user_pass"
            case front_enable = "front_enable"
            case pshow = "pshow"
            case occupation = "occupation"
            case id_other = "id_other"
            case id_issuer = "id_issuer"
            case reset_code = "reset_code"
            case reset_date = "reset_date"
            case img1 = "img1"
            case blocked = "blocked"
            case sof = "sof"
            case cob = "cob"
            case nationality = "nationality"
            case creditsafe_status = "creditsafe_status"
            case ptype = "ptype"
            case created_date = "created_date"
            case ofac_status = "ofac_status"
            case ofac_msg = "ofac_msg"
            case ofac_clear = "ofac_clear"
            case sar_reported = "sar_reported"
            case ofac_list_counter = "ofac_list_counter"
            case ofac_action_date = "ofac_action_date"
            case idf = "idf"
            case img_bstate = "img_bstate"
            case img_bstate1 = "img_bstate1"
            case img_bstate2 = "img_bstate2"
            case img_pay_slip = "img_pay_slip"
            case img_pay_slip1 = "img_pay_slip1"
            case img_pay_slip2 = "img_pay_slip2"
            case img_uti_bill = "img_uti_bill"
            case dec1_img = "dec1_img"
            case emp_detail = "emp_detail"
            case emp_address = "emp_address"
            case co_image = "co_image"
            case id3b_img3 = "id3b_img3"
            case id1b_img1 = "id1b_img1"
            case sys_register_time_stamp = "sys_register_time_stamp"
            case country_issue = "country_issue"
            case m_name = "m_name"
            case id3_img3 = "id3_img3"
            case authenticationID = "AuthenticationID"
            case score = "Score"
            case bandText = "BandText"
            case verified = "verified"
            case verified_date = "verified_date"
            case newsletter = "newsletter"
            case sar_c_status = "sar_c_status"
            case pep = "pep"
            case image_path = "image_path"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            snd_id = try values.decodeIfPresent(String.self, forKey: .snd_id)
            agt_id = try values.decodeIfPresent(String.self, forKey: .agt_id)
            fname = try values.decodeIfPresent(String.self, forKey: .fname)
            mname = try values.decodeIfPresent(String.self, forKey: .mname)
            lname = try values.decodeIfPresent(String.self, forKey: .lname)
            address1 = try values.decodeIfPresent(String.self, forKey: .address1)
            address2 = try values.decodeIfPresent(String.self, forKey: .address2)
            country = try values.decodeIfPresent(String.self, forKey: .country)
            city = try values.decodeIfPresent(String.self, forKey: .city)
            zip = try values.decodeIfPresent(String.self, forKey: .zip)
            phone = try values.decodeIfPresent(String.self, forKey: .phone)
            mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
            fax = try values.decodeIfPresent(String.self, forKey: .fax)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            dob = try values.decodeIfPresent(String.self, forKey: .dob)
            county = try values.decodeIfPresent(String.self, forKey: .county)
            id1 = try values.decodeIfPresent(String.self, forKey: .id1)
            id1_value = try values.decodeIfPresent(String.self, forKey: .id1_value)
            id1_issue = try values.decodeIfPresent(String.self, forKey: .id1_issue)
            id1_expiry = try values.decodeIfPresent(String.self, forKey: .id1_expiry)
            id1_img1 = try values.decodeIfPresent(String.self, forKey: .id1_img1)
            id2 = try values.decodeIfPresent(String.self, forKey: .id2)
            id2_value = try values.decodeIfPresent(String.self, forKey: .id2_value)
            id2_issue = try values.decodeIfPresent(String.self, forKey: .id2_issue)
            id2_expiry = try values.decodeIfPresent(String.self, forKey: .id2_expiry)
            id2_img1 = try values.decodeIfPresent(String.self, forKey: .id2_img1)
            amt_send = try values.decodeIfPresent(String.self, forKey: .amt_send)
            cust_balance = try values.decodeIfPresent(String.self, forKey: .cust_balance)
            old_id = try values.decodeIfPresent(String.self, forKey: .old_id)
            sub_agt_id = try values.decodeIfPresent(String.self, forKey: .sub_agt_id)
            id3 = try values.decodeIfPresent(String.self, forKey: .id3)
            id3_value = try values.decodeIfPresent(String.self, forKey: .id3_value)
            id3_issue = try values.decodeIfPresent(String.self, forKey: .id3_issue)
            id3_expiry = try values.decodeIfPresent(String.self, forKey: .id3_expiry)
            id3_img = try values.decodeIfPresent(String.self, forKey: .id3_img)
            tf_id_type = try values.decodeIfPresent(String.self, forKey: .tf_id_type)
            tf_id_value = try values.decodeIfPresent(String.self, forKey: .tf_id_value)
            tf_id_issue = try values.decodeIfPresent(String.self, forKey: .tf_id_issue)
            tf_id_expire = try values.decodeIfPresent(String.self, forKey: .tf_id_expire)
            snd_ocupation = try values.decodeIfPresent(String.self, forKey: .snd_ocupation)
            snd_ssn = try values.decodeIfPresent(String.self, forKey: .snd_ssn)
            snd_fund = try values.decodeIfPresent(String.self, forKey: .snd_fund)
            door_no = try values.decodeIfPresent(String.self, forKey: .door_no)
            sof_declaration = try values.decodeIfPresent(String.self, forKey: .sof_declaration)
            country_code = try values.decodeIfPresent(String.self, forKey: .country_code)
            country_phone_code = try values.decodeIfPresent(String.self, forKey: .country_phone_code)
            nationality_code = try values.decodeIfPresent(String.self, forKey: .nationality_code)
            sof_code = try values.decodeIfPresent(String.self, forKey: .sof_code)
            pur_of_txn = try values.decodeIfPresent(String.self, forKey: .pur_of_txn)
            xm_id1_type = try values.decodeIfPresent(String.self, forKey: .xm_id1_type)
            xm_id1_no = try values.decodeIfPresent(String.self, forKey: .xm_id1_no)
            xm_id1_issueby = try values.decodeIfPresent(String.self, forKey: .xm_id1_issueby)
            xm_id1_issueat = try values.decodeIfPresent(String.self, forKey: .xm_id1_issueat)
            xm_id1_issue_country = try values.decodeIfPresent(String.self, forKey: .xm_id1_issue_country)
            xm_id1_issue_date = try values.decodeIfPresent(String.self, forKey: .xm_id1_issue_date)
            xm_id1_expiry_date = try values.decodeIfPresent(String.self, forKey: .xm_id1_expiry_date)
            xm_id1_img1 = try values.decodeIfPresent(String.self, forKey: .xm_id1_img1)
            xm_id1_img2 = try values.decodeIfPresent(String.self, forKey: .xm_id1_img2)
            xm_id2_type = try values.decodeIfPresent(String.self, forKey: .xm_id2_type)
            xm_id2_no = try values.decodeIfPresent(String.self, forKey: .xm_id2_no)
            xm_id2_issueby = try values.decodeIfPresent(String.self, forKey: .xm_id2_issueby)
            xm_id2_issueat = try values.decodeIfPresent(String.self, forKey: .xm_id2_issueat)
            xm_id2_issue_country = try values.decodeIfPresent(String.self, forKey: .xm_id2_issue_country)
            xm_id2_issue_date = try values.decodeIfPresent(String.self, forKey: .xm_id2_issue_date)
            xm_id2_expiry_date = try values.decodeIfPresent(String.self, forKey: .xm_id2_expiry_date)
            xm_id2_img1 = try values.decodeIfPresent(String.self, forKey: .xm_id2_img1)
            xm_id2_img2 = try values.decodeIfPresent(String.self, forKey: .xm_id2_img2)
            xm_cust_id = try values.decodeIfPresent(String.self, forKey: .xm_cust_id)
            xm_active = try values.decodeIfPresent(String.self, forKey: .xm_active)
            id4_img = try values.decodeIfPresent(String.self, forKey: .id4_img)
            gender = try values.decodeIfPresent(String.self, forKey: .gender)
            pob = try values.decodeIfPresent(String.self, forKey: .pob)
            pstate = try values.decodeIfPresent(String.self, forKey: .pstate)
            user_login = try values.decodeIfPresent(String.self, forKey: .user_login)
            user_pass = try values.decodeIfPresent(String.self, forKey: .user_pass)
            front_enable = try values.decodeIfPresent(String.self, forKey: .front_enable)
            pshow = try values.decodeIfPresent(String.self, forKey: .pshow)
            occupation = try values.decodeIfPresent(String.self, forKey: .occupation)
            id_other = try values.decodeIfPresent(String.self, forKey: .id_other)
            id_issuer = try values.decodeIfPresent(String.self, forKey: .id_issuer)
            reset_code = try values.decodeIfPresent(String.self, forKey: .reset_code)
            reset_date = try values.decodeIfPresent(String.self, forKey: .reset_date)
            img1 = try values.decodeIfPresent(String.self, forKey: .img1)
            blocked = try values.decodeIfPresent(String.self, forKey: .blocked)
            sof = try values.decodeIfPresent(String.self, forKey: .sof)
            cob = try values.decodeIfPresent(String.self, forKey: .cob)
            nationality = try values.decodeIfPresent(String.self, forKey: .nationality)
            creditsafe_status = try values.decodeIfPresent(String.self, forKey: .creditsafe_status)
            ptype = try values.decodeIfPresent(String.self, forKey: .ptype)
            created_date = try values.decodeIfPresent(String.self, forKey: .created_date)
            ofac_status = try values.decodeIfPresent(String.self, forKey: .ofac_status)
            ofac_msg = try values.decodeIfPresent(String.self, forKey: .ofac_msg)
            ofac_clear = try values.decodeIfPresent(String.self, forKey: .ofac_clear)
            sar_reported = try values.decodeIfPresent(String.self, forKey: .sar_reported)
            ofac_list_counter = try values.decodeIfPresent(String.self, forKey: .ofac_list_counter)
            ofac_action_date = try values.decodeIfPresent(String.self, forKey: .ofac_action_date)
            idf = try values.decodeIfPresent(String.self, forKey: .idf)
            img_bstate = try values.decodeIfPresent(String.self, forKey: .img_bstate)
            img_bstate1 = try values.decodeIfPresent(String.self, forKey: .img_bstate1)
            img_bstate2 = try values.decodeIfPresent(String.self, forKey: .img_bstate2)
            img_pay_slip = try values.decodeIfPresent(String.self, forKey: .img_pay_slip)
            img_pay_slip1 = try values.decodeIfPresent(String.self, forKey: .img_pay_slip1)
            img_pay_slip2 = try values.decodeIfPresent(String.self, forKey: .img_pay_slip2)
            img_uti_bill = try values.decodeIfPresent(String.self, forKey: .img_uti_bill)
            dec1_img = try values.decodeIfPresent(String.self, forKey: .dec1_img)
            emp_detail = try values.decodeIfPresent(String.self, forKey: .emp_detail)
            emp_address = try values.decodeIfPresent(String.self, forKey: .emp_address)
            co_image = try values.decodeIfPresent(String.self, forKey: .co_image)
            id3b_img3 = try values.decodeIfPresent(String.self, forKey: .id3b_img3)
            id1b_img1 = try values.decodeIfPresent(String.self, forKey: .id1b_img1)
            sys_register_time_stamp = try values.decodeIfPresent(String.self, forKey: .sys_register_time_stamp)
            country_issue = try values.decodeIfPresent(String.self, forKey: .country_issue)
            m_name = try values.decodeIfPresent(String.self, forKey: .m_name)
            id3_img3 = try values.decodeIfPresent(String.self, forKey: .id3_img3)
            authenticationID = try values.decodeIfPresent(String.self, forKey: .authenticationID)
            score = try values.decodeIfPresent(String.self, forKey: .score)
            bandText = try values.decodeIfPresent(String.self, forKey: .bandText)
            verified = try values.decodeIfPresent(String.self, forKey: .verified)
            verified_date = try values.decodeIfPresent(String.self, forKey: .verified_date)
            newsletter = try values.decodeIfPresent(String.self, forKey: .newsletter)
            sar_c_status = try values.decodeIfPresent(String.self, forKey: .sar_c_status)
            pep = try values.decodeIfPresent(String.self, forKey: .pep)
            image_path = try values.decodeIfPresent(String.self, forKey: .image_path)
        }

    }

}

struct TransDetails_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let id : String?
        let snd_id : String?
        let rec_id : String?
        let pname : String?
        let paddress : String?
        let phone : String?
        let mobile : String?
        let fax : String?
        let bank : String?
        let bank_ac : String?
        let branch : String?
        let bank_code : String?
        let bank_address : String?
        let ptype : String?
        let cnic : String?
        let city : String?
        let so : String?
        let lname : String?
        let comp_id : String?
        let old_id : String?
        let bank_id : String?
        let country : String?
        let station : String?
        let ac_type : String?
        let zipcode : String?
        let new_type : String?
        let bank_intl : String?
        let bank_ac_intl : String?
        let iban : String?
        let bic : String?
        let bank_address_intl : String?
        let cpf_number : String?
        let last_name : String?
        let relationship : String?
        let dob : String?
        let bank_ac_type : String?
        let mname : String?
        let country_phone_code : String?
        let nationality_code : String?
        let gender : String?
        let pstate : String?
        let bank_iban : String?
        let ifsc : String?
        let swift_code : String?
        let ifsc_code : String?
        let email : String?
        let cnic_type : String?
        let ofac_clear_rcv : String?
        let ofac_list_counter : String?
        let ofac_msg : String?
        let ofac_status : String?
        let ofac_action_date : String?
        let front_end : String?
        let t_type : String?
        let bank_name : String?
        let location_id : String?
        let create_date : String?
        let creditsafe_status : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case snd_id = "snd_id"
            case rec_id = "rec_id"
            case pname = "pname"
            case paddress = "paddress"
            case phone = "phone"
            case mobile = "mobile"
            case fax = "fax"
            case bank = "bank"
            case bank_ac = "bank_ac"
            case branch = "branch"
            case bank_code = "bank_code"
            case bank_address = "bank_address"
            case ptype = "ptype"
            case cnic = "cnic"
            case city = "city"
            case so = "so"
            case lname = "lname"
            case comp_id = "comp_id"
            case old_id = "old_id"
            case bank_id = "bank_id"
            case country = "country"
            case station = "station"
            case ac_type = "ac_type"
            case zipcode = "zipcode"
            case new_type = "new_type"
            case bank_intl = "bank_intl"
            case bank_ac_intl = "bank_ac_intl"
            case iban = "iban"
            case bic = "bic"
            case bank_address_intl = "bank_address_intl"
            case cpf_number = "cpf_number"
            case last_name = "last_name"
            case relationship = "relationship"
            case dob = "dob"
            case bank_ac_type = "bank_ac_type"
            case mname = "mname"
            case country_phone_code = "country_phone_code"
            case nationality_code = "nationality_code"
            case gender = "gender"
            case pstate = "pstate"
            case bank_iban = "bank_iban"
            case ifsc = "ifsc"
            case swift_code = "swift_code"
            case ifsc_code = "ifsc_code"
            case email = "email"
            case cnic_type = "cnic_type"
            case ofac_clear_rcv = "ofac_clear_rcv"
            case ofac_list_counter = "ofac_list_counter"
            case ofac_msg = "ofac_msg"
            case ofac_status = "ofac_status"
            case ofac_action_date = "ofac_action_date"
            case front_end = "front_end"
            case t_type = "t_type"
            case bank_name = "bank_name"
            case location_id = "location_id"
            case create_date = "create_date"
            case creditsafe_status = "creditsafe_status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            snd_id = try values.decodeIfPresent(String.self, forKey: .snd_id)
            rec_id = try values.decodeIfPresent(String.self, forKey: .rec_id)
            pname = try values.decodeIfPresent(String.self, forKey: .pname)
            paddress = try values.decodeIfPresent(String.self, forKey: .paddress)
            phone = try values.decodeIfPresent(String.self, forKey: .phone)
            mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
            fax = try values.decodeIfPresent(String.self, forKey: .fax)
            bank = try values.decodeIfPresent(String.self, forKey: .bank)
            bank_ac = try values.decodeIfPresent(String.self, forKey: .bank_ac)
            branch = try values.decodeIfPresent(String.self, forKey: .branch)
            bank_code = try values.decodeIfPresent(String.self, forKey: .bank_code)
            bank_address = try values.decodeIfPresent(String.self, forKey: .bank_address)
            ptype = try values.decodeIfPresent(String.self, forKey: .ptype)
            cnic = try values.decodeIfPresent(String.self, forKey: .cnic)
            city = try values.decodeIfPresent(String.self, forKey: .city)
            so = try values.decodeIfPresent(String.self, forKey: .so)
            lname = try values.decodeIfPresent(String.self, forKey: .lname)
            comp_id = try values.decodeIfPresent(String.self, forKey: .comp_id)
            old_id = try values.decodeIfPresent(String.self, forKey: .old_id)
            bank_id = try values.decodeIfPresent(String.self, forKey: .bank_id)
            country = try values.decodeIfPresent(String.self, forKey: .country)
            station = try values.decodeIfPresent(String.self, forKey: .station)
            ac_type = try values.decodeIfPresent(String.self, forKey: .ac_type)
            zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
            new_type = try values.decodeIfPresent(String.self, forKey: .new_type)
            bank_intl = try values.decodeIfPresent(String.self, forKey: .bank_intl)
            bank_ac_intl = try values.decodeIfPresent(String.self, forKey: .bank_ac_intl)
            iban = try values.decodeIfPresent(String.self, forKey: .iban)
            bic = try values.decodeIfPresent(String.self, forKey: .bic)
            bank_address_intl = try values.decodeIfPresent(String.self, forKey: .bank_address_intl)
            cpf_number = try values.decodeIfPresent(String.self, forKey: .cpf_number)
            last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
            relationship = try values.decodeIfPresent(String.self, forKey: .relationship)
            dob = try values.decodeIfPresent(String.self, forKey: .dob)
            bank_ac_type = try values.decodeIfPresent(String.self, forKey: .bank_ac_type)
            mname = try values.decodeIfPresent(String.self, forKey: .mname)
            country_phone_code = try values.decodeIfPresent(String.self, forKey: .country_phone_code)
            nationality_code = try values.decodeIfPresent(String.self, forKey: .nationality_code)
            gender = try values.decodeIfPresent(String.self, forKey: .gender)
            pstate = try values.decodeIfPresent(String.self, forKey: .pstate)
            bank_iban = try values.decodeIfPresent(String.self, forKey: .bank_iban)
            ifsc = try values.decodeIfPresent(String.self, forKey: .ifsc)
            swift_code = try values.decodeIfPresent(String.self, forKey: .swift_code)
            ifsc_code = try values.decodeIfPresent(String.self, forKey: .ifsc_code)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            cnic_type = try values.decodeIfPresent(String.self, forKey: .cnic_type)
            ofac_clear_rcv = try values.decodeIfPresent(String.self, forKey: .ofac_clear_rcv)
            ofac_list_counter = try values.decodeIfPresent(String.self, forKey: .ofac_list_counter)
            ofac_msg = try values.decodeIfPresent(String.self, forKey: .ofac_msg)
            ofac_status = try values.decodeIfPresent(String.self, forKey: .ofac_status)
            ofac_action_date = try values.decodeIfPresent(String.self, forKey: .ofac_action_date)
            front_end = try values.decodeIfPresent(String.self, forKey: .front_end)
            t_type = try values.decodeIfPresent(String.self, forKey: .t_type)
            bank_name = try values.decodeIfPresent(String.self, forKey: .bank_name)
            location_id = try values.decodeIfPresent(String.self, forKey: .location_id)
            create_date = try values.decodeIfPresent(String.self, forKey: .create_date)
            creditsafe_status = try values.decodeIfPresent(String.self, forKey: .creditsafe_status)
        }

    }

}

struct Transactions_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    var data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let trans : String?
        let tid : String?
        let tdate : String?
        let ad_rate : String?
        let tcharges : String?
        let tlt_gbp : String?
        let tlt_pkr : String?
        let station_id : String?
        let snd_id : String?
        let rcv_id : String?
        let cm_orderCode : String?
        let pstatus : String?
        let curr : String?
        let comp_trans_id : String?
        let comp_trans_id_sub : String?
        let cm_pay_status : String?
        let fname : String?
        let lname : String?
        let snd_adr1 : String?
        let snd_adr2 : String?
        let bene_fname : String?
        let bene_so : String?
        let bene_lname : String?
        let station_city : String?

        enum CodingKeys: String, CodingKey {

            case trans = "trans"
            case tid = "tid"
            case tdate = "tdate"
            case ad_rate = "ad_rate"
            case tcharges = "tcharges"
            case tlt_gbp = "tlt_gbp"
            case tlt_pkr = "tlt_pkr"
            case station_id = "station_id"
            case snd_id = "snd_id"
            case rcv_id = "rcv_id"
            case cm_orderCode = "cm_orderCode"
            case pstatus = "pstatus"
            case curr = "curr"
            case comp_trans_id = "comp_trans_id"
            case comp_trans_id_sub = "comp_trans_id_sub"
            case cm_pay_status = "cm_pay_status"
            case fname = "fname"
            case lname = "lname"
            case snd_adr1 = "snd_adr1"
            case snd_adr2 = "snd_adr2"
            case bene_fname = "bene_fname"
            case bene_so = "bene_so"
            case bene_lname = "bene_lname"
            case station_city = "station_city"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            trans = try values.decodeIfPresent(String.self, forKey: .trans)
            tid = try values.decodeIfPresent(String.self, forKey: .tid)
            tdate = try values.decodeIfPresent(String.self, forKey: .tdate)
            ad_rate = try values.decodeIfPresent(String.self, forKey: .ad_rate)
            tcharges = try values.decodeIfPresent(String.self, forKey: .tcharges)
            tlt_gbp = try values.decodeIfPresent(String.self, forKey: .tlt_gbp)
            tlt_pkr = try values.decodeIfPresent(String.self, forKey: .tlt_pkr)
            station_id = try values.decodeIfPresent(String.self, forKey: .station_id)
            snd_id = try values.decodeIfPresent(String.self, forKey: .snd_id)
            rcv_id = try values.decodeIfPresent(String.self, forKey: .rcv_id)
            cm_orderCode = try values.decodeIfPresent(String.self, forKey: .cm_orderCode)
            pstatus = try values.decodeIfPresent(String.self, forKey: .pstatus)
            curr = try values.decodeIfPresent(String.self, forKey: .curr)
            comp_trans_id = try values.decodeIfPresent(String.self, forKey: .comp_trans_id)
            comp_trans_id_sub = try values.decodeIfPresent(String.self, forKey: .comp_trans_id_sub)
            cm_pay_status = try values.decodeIfPresent(String.self, forKey: .cm_pay_status)
            fname = try values.decodeIfPresent(String.self, forKey: .fname)
            lname = try values.decodeIfPresent(String.self, forKey: .lname)
            snd_adr1 = try values.decodeIfPresent(String.self, forKey: .snd_adr1)
            snd_adr2 = try values.decodeIfPresent(String.self, forKey: .snd_adr2)
            bene_fname = try values.decodeIfPresent(String.self, forKey: .bene_fname)
            bene_so = try values.decodeIfPresent(String.self, forKey: .bene_so)
            bene_lname = try values.decodeIfPresent(String.self, forKey: .bene_lname)
            station_city = try values.decodeIfPresent(String.self, forKey: .station_city)
        }

    }

}

struct Submit_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : String?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent(String.self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

}

struct Section_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let id : String?
        let city : String?
        let company : String?
        let pname : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case city = "city"
            case company = "company"
            case pname = "pname"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            city = try values.decodeIfPresent(String.self, forKey: .city)
            company = try values.decodeIfPresent(String.self, forKey: .company)
            pname = try values.decodeIfPresent(String.self, forKey: .pname)
        }

    }

}

struct GBP_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : Data?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let comp_id : String?
        let rate : String?

        enum CodingKeys: String, CodingKey {

            case comp_id = "comp_id"
            case rate = "rate"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            comp_id = try values.decodeIfPresent(String.self, forKey: .comp_id)
            rate = try values.decodeIfPresent(String.self, forKey: .rate)
        }

    }

}

struct Ava_Company_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let mainid : String?
        let country_name : String?
        let company : String?
        let ccode : String?
        let bank_rate : String?
        let adm_rate : String?
        let pshow : String?
        let up_limit_cash : String?
        let up_limit_bank : String?
        let low_limit : String?
        let low_limit_chr : String?
        let comp_trans_id : String?
        let ad_charges : String?
        let adm_rate2 : String?
        let adm_rate3 : String?
        let adm_rate4 : String?
        let cust_rate : String?
        let comp_trans_id_sub : String?
        let curr : String?
        let loginid : String?
        let upass : String?
        let pactive : String?
        let my_pin_sub : String?
        let my_pin : String?
        let cust_charges : String?
        let front_show : String?
        let fx_dealer : String?

        enum CodingKeys: String, CodingKey {

            case mainid = "mainid"
            case country_name = "country_name"
            case company = "company"
            case ccode = "ccode"
            case bank_rate = "bank_rate"
            case adm_rate = "adm_rate"
            case pshow = "pshow"
            case up_limit_cash = "up_limit_cash"
            case up_limit_bank = "up_limit_bank"
            case low_limit = "low_limit"
            case low_limit_chr = "low_limit_chr"
            case comp_trans_id = "comp_trans_id"
            case ad_charges = "ad_charges"
            case adm_rate2 = "adm_rate2"
            case adm_rate3 = "adm_rate3"
            case adm_rate4 = "adm_rate4"
            case cust_rate = "cust_rate"
            case comp_trans_id_sub = "comp_trans_id_sub"
            case curr = "curr"
            case loginid = "loginid"
            case upass = "upass"
            case pactive = "pactive"
            case my_pin_sub = "my_pin_sub"
            case my_pin = "my_pin"
            case cust_charges = "cust_charges"
            case front_show = "front_show"
            case fx_dealer = "fx_dealer"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            mainid = try values.decodeIfPresent(String.self, forKey: .mainid)
            country_name = try values.decodeIfPresent(String.self, forKey: .country_name)
            company = try values.decodeIfPresent(String.self, forKey: .company)
            ccode = try values.decodeIfPresent(String.self, forKey: .ccode)
            bank_rate = try values.decodeIfPresent(String.self, forKey: .bank_rate)
            adm_rate = try values.decodeIfPresent(String.self, forKey: .adm_rate)
            pshow = try values.decodeIfPresent(String.self, forKey: .pshow)
            up_limit_cash = try values.decodeIfPresent(String.self, forKey: .up_limit_cash)
            up_limit_bank = try values.decodeIfPresent(String.self, forKey: .up_limit_bank)
            low_limit = try values.decodeIfPresent(String.self, forKey: .low_limit)
            low_limit_chr = try values.decodeIfPresent(String.self, forKey: .low_limit_chr)
            comp_trans_id = try values.decodeIfPresent(String.self, forKey: .comp_trans_id)
            ad_charges = try values.decodeIfPresent(String.self, forKey: .ad_charges)
            adm_rate2 = try values.decodeIfPresent(String.self, forKey: .adm_rate2)
            adm_rate3 = try values.decodeIfPresent(String.self, forKey: .adm_rate3)
            adm_rate4 = try values.decodeIfPresent(String.self, forKey: .adm_rate4)
            cust_rate = try values.decodeIfPresent(String.self, forKey: .cust_rate)
            comp_trans_id_sub = try values.decodeIfPresent(String.self, forKey: .comp_trans_id_sub)
            curr = try values.decodeIfPresent(String.self, forKey: .curr)
            loginid = try values.decodeIfPresent(String.self, forKey: .loginid)
            upass = try values.decodeIfPresent(String.self, forKey: .upass)
            pactive = try values.decodeIfPresent(String.self, forKey: .pactive)
            my_pin_sub = try values.decodeIfPresent(String.self, forKey: .my_pin_sub)
            my_pin = try values.decodeIfPresent(String.self, forKey: .my_pin)
            cust_charges = try values.decodeIfPresent(String.self, forKey: .cust_charges)
            front_show = try values.decodeIfPresent(String.self, forKey: .front_show)
            fx_dealer = try values.decodeIfPresent(String.self, forKey: .fx_dealer)
        }

    }

}

struct benificiaryDetails_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let id : String?
        let snd_id : String?
        let rec_id : String?
        let pname : String?
        let paddress : String?
        let phone : String?
        let mobile : String?
        let fax : String?
        let bank : String?
        let bank_ac : String?
        let branch : String?
        let bank_code : String?
        let bank_address : String?
        let ptype : String?
        let cnic : String?
        let city : String?
        let so : String?
        let lname : String?
        let comp_id : String?
        let old_id : String?
        let bank_id : String?
        let country : String?
        let station : String?
        let ac_type : String?
        let zipcode : String?
        let new_type : String?
        let bank_intl : String?
        let bank_ac_intl : String?
        let iban : String?
        let bic : String?
        let bank_address_intl : String?
        let cpf_number : String?
        let last_name : String?
        let relationship : String?
        let dob : String?
        let bank_ac_type : String?
        let mname : String?
        let country_phone_code : String?
        let nationality_code : String?
        let gender : String?
        let pstate : String?
        let bank_iban : String?
        let ifsc : String?
        let swift_code : String?
        let ifsc_code : String?
        let email : String?
        let cnic_type : String?
        let ofac_clear_rcv : String?
        let ofac_list_counter : String?
        let ofac_msg : String?
        let ofac_status : String?
        let ofac_action_date : String?
        let front_end : String?
        let t_type : String?
        let bank_name : String?
        let location_id : String?
        let create_date : String?
        let creditsafe_status : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case snd_id = "snd_id"
            case rec_id = "rec_id"
            case pname = "pname"
            case paddress = "paddress"
            case phone = "phone"
            case mobile = "mobile"
            case fax = "fax"
            case bank = "bank"
            case bank_ac = "bank_ac"
            case branch = "branch"
            case bank_code = "bank_code"
            case bank_address = "bank_address"
            case ptype = "ptype"
            case cnic = "cnic"
            case city = "city"
            case so = "so"
            case lname = "lname"
            case comp_id = "comp_id"
            case old_id = "old_id"
            case bank_id = "bank_id"
            case country = "country"
            case station = "station"
            case ac_type = "ac_type"
            case zipcode = "zipcode"
            case new_type = "new_type"
            case bank_intl = "bank_intl"
            case bank_ac_intl = "bank_ac_intl"
            case iban = "iban"
            case bic = "bic"
            case bank_address_intl = "bank_address_intl"
            case cpf_number = "cpf_number"
            case last_name = "last_name"
            case relationship = "relationship"
            case dob = "dob"
            case bank_ac_type = "bank_ac_type"
            case mname = "mname"
            case country_phone_code = "country_phone_code"
            case nationality_code = "nationality_code"
            case gender = "gender"
            case pstate = "pstate"
            case bank_iban = "bank_iban"
            case ifsc = "ifsc"
            case swift_code = "swift_code"
            case ifsc_code = "ifsc_code"
            case email = "email"
            case cnic_type = "cnic_type"
            case ofac_clear_rcv = "ofac_clear_rcv"
            case ofac_list_counter = "ofac_list_counter"
            case ofac_msg = "ofac_msg"
            case ofac_status = "ofac_status"
            case ofac_action_date = "ofac_action_date"
            case front_end = "front_end"
            case t_type = "t_type"
            case bank_name = "bank_name"
            case location_id = "location_id"
            case create_date = "create_date"
            case creditsafe_status = "creditsafe_status"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            snd_id = try values.decodeIfPresent(String.self, forKey: .snd_id)
            rec_id = try values.decodeIfPresent(String.self, forKey: .rec_id)
            pname = try values.decodeIfPresent(String.self, forKey: .pname)
            paddress = try values.decodeIfPresent(String.self, forKey: .paddress)
            phone = try values.decodeIfPresent(String.self, forKey: .phone)
            mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
            fax = try values.decodeIfPresent(String.self, forKey: .fax)
            bank = try values.decodeIfPresent(String.self, forKey: .bank)
            bank_ac = try values.decodeIfPresent(String.self, forKey: .bank_ac)
            branch = try values.decodeIfPresent(String.self, forKey: .branch)
            bank_code = try values.decodeIfPresent(String.self, forKey: .bank_code)
            bank_address = try values.decodeIfPresent(String.self, forKey: .bank_address)
            ptype = try values.decodeIfPresent(String.self, forKey: .ptype)
            cnic = try values.decodeIfPresent(String.self, forKey: .cnic)
            city = try values.decodeIfPresent(String.self, forKey: .city)
            so = try values.decodeIfPresent(String.self, forKey: .so)
            lname = try values.decodeIfPresent(String.self, forKey: .lname)
            comp_id = try values.decodeIfPresent(String.self, forKey: .comp_id)
            old_id = try values.decodeIfPresent(String.self, forKey: .old_id)
            bank_id = try values.decodeIfPresent(String.self, forKey: .bank_id)
            country = try values.decodeIfPresent(String.self, forKey: .country)
            station = try values.decodeIfPresent(String.self, forKey: .station)
            ac_type = try values.decodeIfPresent(String.self, forKey: .ac_type)
            zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
            new_type = try values.decodeIfPresent(String.self, forKey: .new_type)
            bank_intl = try values.decodeIfPresent(String.self, forKey: .bank_intl)
            bank_ac_intl = try values.decodeIfPresent(String.self, forKey: .bank_ac_intl)
            iban = try values.decodeIfPresent(String.self, forKey: .iban)
            bic = try values.decodeIfPresent(String.self, forKey: .bic)
            bank_address_intl = try values.decodeIfPresent(String.self, forKey: .bank_address_intl)
            cpf_number = try values.decodeIfPresent(String.self, forKey: .cpf_number)
            last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
            relationship = try values.decodeIfPresent(String.self, forKey: .relationship)
            dob = try values.decodeIfPresent(String.self, forKey: .dob)
            bank_ac_type = try values.decodeIfPresent(String.self, forKey: .bank_ac_type)
            mname = try values.decodeIfPresent(String.self, forKey: .mname)
            country_phone_code = try values.decodeIfPresent(String.self, forKey: .country_phone_code)
            nationality_code = try values.decodeIfPresent(String.self, forKey: .nationality_code)
            gender = try values.decodeIfPresent(String.self, forKey: .gender)
            pstate = try values.decodeIfPresent(String.self, forKey: .pstate)
            bank_iban = try values.decodeIfPresent(String.self, forKey: .bank_iban)
            ifsc = try values.decodeIfPresent(String.self, forKey: .ifsc)
            swift_code = try values.decodeIfPresent(String.self, forKey: .swift_code)
            ifsc_code = try values.decodeIfPresent(String.self, forKey: .ifsc_code)
            email = try values.decodeIfPresent(String.self, forKey: .email)
            cnic_type = try values.decodeIfPresent(String.self, forKey: .cnic_type)
            ofac_clear_rcv = try values.decodeIfPresent(String.self, forKey: .ofac_clear_rcv)
            ofac_list_counter = try values.decodeIfPresent(String.self, forKey: .ofac_list_counter)
            ofac_msg = try values.decodeIfPresent(String.self, forKey: .ofac_msg)
            ofac_status = try values.decodeIfPresent(String.self, forKey: .ofac_status)
            ofac_action_date = try values.decodeIfPresent(String.self, forKey: .ofac_action_date)
            front_end = try values.decodeIfPresent(String.self, forKey: .front_end)
            t_type = try values.decodeIfPresent(String.self, forKey: .t_type)
            bank_name = try values.decodeIfPresent(String.self, forKey: .bank_name)
            location_id = try values.decodeIfPresent(String.self, forKey: .location_id)
            create_date = try values.decodeIfPresent(String.self, forKey: .create_date)
            creditsafe_status = try values.decodeIfPresent(String.self, forKey: .creditsafe_status)
        }

    }

}

struct Benificiary_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    var data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }
    
    struct Data : Codable {
        let ptype : String?
        let pname : String?
        let paddress : String?
        let phone : String?
        let city : String?
        let pstate : String?
        let id : String?
        let bank_ac : String?
        let branch : String?
        let bank_code : String?
        let lname : String?
        let country : String?

        enum CodingKeys: String, CodingKey {

            case ptype = "ptype"
            case pname = "pname"
            case paddress = "paddress"
            case phone = "phone"
            case city = "city"
            case pstate = "pstate"
            case id = "id"
            case bank_ac = "bank_ac"
            case branch = "branch"
            case bank_code = "bank_code"
            case lname = "lname"
            case country = "country"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            ptype = try values.decodeIfPresent(String.self, forKey: .ptype)
            pname = try values.decodeIfPresent(String.self, forKey: .pname)
            paddress = try values.decodeIfPresent(String.self, forKey: .paddress)
            phone = try values.decodeIfPresent(String.self, forKey: .phone)
            city = try values.decodeIfPresent(String.self, forKey: .city)
            pstate = try values.decodeIfPresent(String.self, forKey: .pstate)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            bank_ac = try values.decodeIfPresent(String.self, forKey: .bank_ac)
            branch = try values.decodeIfPresent(String.self, forKey: .branch)
            bank_code = try values.decodeIfPresent(String.self, forKey: .bank_code)
            lname = try values.decodeIfPresent(String.self, forKey: .lname)
            country = try values.decodeIfPresent(String.self, forKey: .country)
        }

    }


}

struct terms_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let mainid : String?
        let pname : String?
        let pdetail : String?
        let ptype : String?
        let plink : String?
        let img1 : String?
        let img_position : String?
        let phead : String?
        let keywords : String?
        let description : String?
        let pshow : String?

        enum CodingKeys: String, CodingKey {

            case mainid = "mainid"
            case pname = "pname"
            case pdetail = "pdetail"
            case ptype = "ptype"
            case plink = "plink"
            case img1 = "img1"
            case img_position = "img_position"
            case phead = "phead"
            case keywords = "keywords"
            case description = "description"
            case pshow = "pshow"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            mainid = try values.decodeIfPresent(String.self, forKey: .mainid)
            pname = try values.decodeIfPresent(String.self, forKey: .pname)
            pdetail = try values.decodeIfPresent(String.self, forKey: .pdetail)
            ptype = try values.decodeIfPresent(String.self, forKey: .ptype)
            plink = try values.decodeIfPresent(String.self, forKey: .plink)
            img1 = try values.decodeIfPresent(String.self, forKey: .img1)
            img_position = try values.decodeIfPresent(String.self, forKey: .img_position)
            phead = try values.decodeIfPresent(String.self, forKey: .phead)
            keywords = try values.decodeIfPresent(String.self, forKey: .keywords)
            description = try values.decodeIfPresent(String.self, forKey: .description)
            pshow = try values.decodeIfPresent(String.self, forKey: .pshow)
        }

    }

}

struct Ledger_Base : Codable {
    let response : String?
    let msg_code : String?
    let msg_description : String?
    let data : [Data]?
    let time_key : Int?
    let ip : String?
    let host : String?

    enum CodingKeys: String, CodingKey {

        case response = "response"
        case msg_code = "msg_code"
        case msg_description = "msg_description"
        case data = "data"
        case time_key = "time_key"
        case ip = "ip"
        case host = "Host"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response = try values.decodeIfPresent(String.self, forKey: .response)
        msg_code = try values.decodeIfPresent(String.self, forKey: .msg_code)
        msg_description = try values.decodeIfPresent(String.self, forKey: .msg_description)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
        time_key = try values.decodeIfPresent(Int.self, forKey: .time_key)
        ip = try values.decodeIfPresent(String.self, forKey: .ip)
        host = try values.decodeIfPresent(String.self, forKey: .host)
    }

    struct Data : Codable {
        let mitcno : String?
        let v_date : String?
        let debt : String?
        let credit : String?
        let trans_type : String?
        let cur_agent : String?

        enum CodingKeys: String, CodingKey {

            case mitcno = "mitcno"
            case v_date = "v_date"
            case debt = "debt"
            case credit = "credit"
            case trans_type = "trans_type"
            case cur_agent = "cur_agent"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            mitcno = try values.decodeIfPresent(String.self, forKey: .mitcno)
            v_date = try values.decodeIfPresent(String.self, forKey: .v_date)
            debt = try values.decodeIfPresent(String.self, forKey: .debt)
            credit = try values.decodeIfPresent(String.self, forKey: .credit)
            trans_type = try values.decodeIfPresent(String.self, forKey: .trans_type)
            cur_agent = try values.decodeIfPresent(String.self, forKey: .cur_agent)
        }

    }

}
