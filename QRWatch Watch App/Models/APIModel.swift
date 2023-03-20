//
//  APIModel.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 3/8/23.
//

import Foundation



enum APIEndPoints{
    
    private var baseURL: String { return "https://mobi.parcnroll.com" }
    
    case login // Login Api uat- https://mobi.parcnroll.com/web/webLogin
    case loginSuccess // Login success profile Api uat- https://mobi.parcnroll.com/web/webMe
    
    case bookingList // https://mobi.parcnroll.com/web/ReservationDetailshow
    case bookingDetails  //Booking details Api uat- https://mobi.parcnroll.com/web/bookingSummary
    

    private var fullPath: String {
        var endPoint = ""
        switch self {
        case .login:
            endPoint = "/web/webLogin"
        case .loginSuccess:
            endPoint = "/web/webMe"
        case .bookingList:
            endPoint = "/web/ReservationDetailshow"
        case .bookingDetails:
            endPoint = "/web/bookingSummary"
        }
        return baseURL+endPoint
    }
    
    var url: URL {
        guard let url = URL(string: fullPath) else{ preconditionFailure("The url used in \(APIEndPoints.self) is not valid") }
        return url
    }
}
