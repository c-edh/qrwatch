//
//  ViewModel.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 2/28/23.
//

import Foundation
//import CoreGraphics

class ViewModel: ObservableObject{

    
    func getBookings() -> [BookingModel]{
        return [.init(date: Date(), place: "Turlock", duaration: 3.0),
                .init(date: Date() - 3600, place: "Modesto", duaration: 0.5),
                .init(date: Date() - 36_000_000, place: "SF", duaration: 4)]
        
    }
    
    func getParkEndHour(timeOfParking: Date, duration: Double) -> String{
        let endTime = timeOfParking + duration * 3600
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let parktime = dateFormatter.string(from: endTime)
        return parktime
    }
    
    func getTimeRemaining(timeOfParking: Date, duration: Double) -> String{
        let endTime = timeOfParking + duration * 3600
        let timeInterval = endTime.timeIntervalSinceNow
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        let stringTime = formatter.string(from: timeInterval)
       // print(stringTime)
        return stringTime ?? "n/a"
    }
    
    
    
    
}


