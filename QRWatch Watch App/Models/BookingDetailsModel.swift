//
//  BookingDetail.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 3/7/23.
//

import Foundation
import MapKit


struct BookingDetailsModel: Decodable{
    let status: Bool
    let data: [BookingData]?
    let amenitiesName: String
    let servicesNames: String
    let ridesName: String
   // let things:
    
    let latitude: Double?
    let longitude: Double?
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
        case amenitiesName = "amenities_name"
        case servicesNames = "serivices_name" //not a typo
        case ridesName = "rides_name"
        case latitude = "latitude"
        case longitude = "longitude"
        case createdAt = "created_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        //Info
        self.status = try container.decodeIfPresent(Bool.self, forKey: .status) ?? false
        self.data = try container.decodeIfPresent([BookingData].self, forKey: .data)
        
        //Names
        self.amenitiesName = try container.decodeIfPresent(String.self, forKey: .amenitiesName) ?? "N/A"
        self.servicesNames = try container.decodeIfPresent(String.self, forKey: .servicesNames) ?? "N/A"
        self.ridesName = try container.decodeIfPresent(String.self, forKey: .ridesName) ?? "N/A"
        
        //Location
        self.latitude = try Double(container.decodeIfPresent(String.self, forKey: .latitude) ?? "0.0")
        self.longitude = try Double(container.decodeIfPresent(String.self, forKey: .longitude) ?? "0.0")
        
        //Time
        self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt) ?? "N/A"
    }
}

struct BookingData:Decodable{
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let bookingID: String
    let fromDate: Date? // Date
    let toHour: Date? //Date
    let total: String
    let tax: String
    let option: String
    let propertyName: String
    let logo: String?
    let qrCode: String?
    let slot: Int
    let licensePlate: String
    let makeModel: String
    let latitude: String
    let longitude: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email = "email"
        case bookingID = "booking_id"
        case fromDate = "from_date"
        case toHour = "to_hour"
        case total = "total"
        case tax = "tax"
        case option = "option"
        case propertyName = "property_name"
        case logo = "logo"
        case qrCode = "qr_code"
        case slot = "slot"
        case licensePlate = "license_plate"
        case makeModel = "make_model"
        case latitude = "latitude"
        case longitude = "longitude"
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        
        //User Information
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName) ?? "N/A"
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName) ?? "N/A"
        self.email = try container.decodeIfPresent(String.self, forKey: .email) ?? "N/A"
        
        //Booking Information
        self.bookingID = try container.decodeIfPresent(String.self, forKey: .bookingID) ?? "N/A"
        self.fromDate = try container.decodeIfPresent(Date.self, forKey: .fromDate)  //Date
        self.toHour = try container.decodeIfPresent(Date.self, forKey: .toHour) //Date
        self.total = try container.decodeIfPresent(String.self, forKey: .total) ?? "N/A"
        self.tax = try container.decodeIfPresent(String.self, forKey: .tax) ?? "N/A"
        self.option = try container.decodeIfPresent(String.self, forKey: .option) ?? "N/A"
        self.propertyName = try container.decodeIfPresent(String.self, forKey: .propertyName) ?? "N/A"
        self.logo = try container.decodeIfPresent(String.self, forKey: .logo)
        self.qrCode = try container.decodeIfPresent(String.self, forKey: .qrCode)
        self.slot = try container.decode(Int.self, forKey: .slot)
       
        //Car information
        self.licensePlate = try container.decodeIfPresent(String.self, forKey: .licensePlate) ?? "N/A"
        self.makeModel = try container.decodeIfPresent(String.self, forKey: .makeModel) ?? "N/A"
        
        //Location Information
        self.latitude = try container.decodeIfPresent(String.self, forKey: .latitude) ?? "N/A"
        self.longitude = try container.decodeIfPresent(String.self, forKey: .longitude) ?? "N/A"
    }
}
