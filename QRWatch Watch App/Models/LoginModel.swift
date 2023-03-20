//
//  LoginModel.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 3/8/23.
//

import Foundation

struct LoginModel: Decodable{
    let user_name: String?
    let user_email: String?
    let access_token: String?
    let token_type: String?
    let expires_in: Int?
    
    enum CodingKeys: String, CodingKey {
        case user_name = "user_name"
        case user_email = "user_email"
        case access_token = "access_token"
        case token_type = "token_type"
        case expires_in = "expires_in"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.user_name = try container.decodeIfPresent(String.self, forKey: .user_name)
        self.user_email = try container.decodeIfPresent(String.self, forKey: .user_email)
        self.access_token = try container.decodeIfPresent(String.self, forKey: .access_token)
        self.token_type = try container.decodeIfPresent(String.self, forKey: .token_type)
        self.expires_in = try container.decodeIfPresent(Int.self, forKey: .expires_in)
    }
}

struct LoginSuccessModel: Decodable{
    let id: Int?
    let first_name: String?
    let last_name: String?
    let email: String?
    let phone_no: String?
    let remember_token: String?
    let ipaddress: String?
    let google_id: String?
    let facebook_id: String?
    let login_type: String?
    let zip_code: String? //Might be int
    let how_you_hear_about_us: String?
    let specify_other: String?
    let newsletter: String?
    let last_login_at: String?
    let created_at: String?
    let updated_at: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case first_name = "first_name"
        case last_name =  "last_name"
        case email = "email"
        case phone_no = "phone_no"
        case remember_token = "remember_token"
        case ipaddress = "ipaddress"
        case google_id = "google_id"
        case facebook_id =  "facebook_id"
        case login_type = "login_type"
        case zip_code = "zip_code"
        case how_you_hear_about_us = "how_you_hear_about_us"
        case specify_other = "specify_other"
        case newsletter = "newsletter"
        case last_login_at = "last_login_at"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.first_name = try container.decodeIfPresent(String.self, forKey: .first_name)
        self.last_name = try container.decodeIfPresent(String.self, forKey: .last_name)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.phone_no = try container.decodeIfPresent(String.self, forKey: .phone_no)
        self.remember_token = try container.decodeIfPresent(String.self, forKey: .remember_token)
        self.ipaddress = try container.decodeIfPresent(String.self, forKey: .ipaddress)
        self.google_id = try container.decodeIfPresent(String.self, forKey: .google_id)
        self.facebook_id = try container.decodeIfPresent(String.self, forKey: .facebook_id)
        self.login_type = try container.decodeIfPresent(String.self, forKey: .login_type)
        self.zip_code = try container.decodeIfPresent(String.self, forKey: .zip_code)
        self.how_you_hear_about_us = try container.decodeIfPresent(String.self, forKey: .how_you_hear_about_us)
        self.specify_other = try container.decodeIfPresent(String.self, forKey: .specify_other)
        self.newsletter = try container.decodeIfPresent(String.self, forKey: .newsletter)
        self.last_login_at = try container.decodeIfPresent(String.self, forKey: .last_login_at)
        self.created_at = try container.decodeIfPresent(String.self, forKey: .created_at)
        self.updated_at = try container.decodeIfPresent(String.self, forKey: .updated_at)
    }
    
    
}
