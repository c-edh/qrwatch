//
//  ViewModel.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 2/28/23.
//

import Foundation

protocol ViewModelProtocol: ObservableObject{
    func getBookings()
    
}

class ViewModel: ViewModelProtocol{

    @Published var currentBookings: [BookingData] = []
     @Published var pastBookings: [BookingModel] = []
    
    private let apiManager = APIManager()
    private let dataDecoder = DataDecoder()
    
    func getBookingHistory(){
//        var current: [BookingModel] = []
//        var past: [BookingModel] = []
//
//        for booking in getBookings(){
//           if  (booking.date + (booking.duaration*3600)) >= Date(){
//               current.append(booking)
//
//           }else{
//               past.append(booking)
//           }
//        }
//        DispatchQueue.main.async {
//            self.currentBookings = current
//            self.pastBookings = past
//        }
//
//        print(pastBookings)
//
    
    }
    
    func login(){
        apiManager.getData(url: .login) { [weak self] result in
            switch result {
            case .success(let loginSuccess):
                print("hi")
                
            case .failure(let failure):
                //
                print(failure)
            }
        }
    }
    
    func getBookings(){
        apiManager.getData(url: .bookingList) { [weak self] result in
            switch result {
            case .success(let data):
                guard let bookingDetail = self?.dataDecoder.decodeAPIData(decode: data, type: BookingDetailsModel.self) else{ return }
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
//    func getParkTime(timeOfParking: Date) -> String{
//        let endTime = timeOfParking
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM d, h:mm a"
//        let parktime = dateFormatter.string(from: endTime)
//        return parktime
//    }
//
//    func getParkEndHour(timeOfParking: Date, duration: Double) -> String{
//        let endTime = timeOfParking + duration * 3600
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "h:mm a"
//        let parktime = dateFormatter.string(from: endTime)
//        return parktime
//    }
//
//    func getTimeRemaining(timeOfParking: Date, duration: Double) -> String{
//        let endTime = timeOfParking + duration * 3600
//        let timeInterval = endTime.timeIntervalSinceNow
//        let formatter = DateComponentsFormatter()
//        formatter.allowedUnits = [.hour, .minute]
//        let stringTime = formatter.string(from: timeInterval)
//       // print(stringTime)
//        return stringTime ?? "n/a"
//    }
}


