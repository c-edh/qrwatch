//
//  BookingModel.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 3/1/23.
//

import Foundation

struct BookingModel: Identifiable{
    let id = UUID()
    let date: Date
    let place: String //Will be coordinate
    let duaration: Double //hours
}
