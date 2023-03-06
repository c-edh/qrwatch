//
//  ViewModel.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 2/28/23.
//

import Foundation
//import CoreGraphics

class ViewModel: ObservableObject{

    @Published var currentBookings: [BookingModel] = []
     @Published var pastBookings: [BookingModel] = []
    
    func getBookingHistory(){
        var current: [BookingModel] = []
        var past: [BookingModel] = []
        
        for booking in getBookings(){
           if  (booking.date + (booking.duaration*3600)) >= Date(){
               current.append(booking)
                
           }else{
               past.append(booking)
           }
        }
        DispatchQueue.main.async {
            self.currentBookings = current
            self.pastBookings = past
        }

        print(pastBookings)
        
    
    }
    
    func getBookings() -> [BookingModel]{
        return [.init(date: Date(), place: "Turlock", duaration: 3.0),
                .init(date: Date() - 3600, place: "Modesto", duaration: 0.5),
                .init(date: Date() - 36_000_000, place: "SF", duaration: 4)]
        
    }
    
    func getParkTime(timeOfParking: Date) -> String{
        let endTime = timeOfParking
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, h:mm a"
        let parktime = dateFormatter.string(from: endTime)
        return parktime
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


