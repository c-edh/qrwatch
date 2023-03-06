//
//  ContentView.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 2/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Image("logo").resizable().frame(width: 20,height: 20).cornerRadius(6)
                    Text("ParkRoll")
                        .foregroundColor(.green)
                }.frame(maxWidth: .infinity,alignment: .leading)
                
                ScrollView{
                    HStack{
                        Text("Remaining:").scaledToFit().minimumScaleFactor(0.5)
                        Text(" \(viewModel.getTimeRemaining(timeOfParking: viewModel.getBookings()[0].date, duration: viewModel.getBookings()[0].duaration))")
                            .frame(maxWidth: .infinity,alignment: .trailing).font(.title)
                    }
                    
                    NavigationLink {
                        Text("QR Code") //Placeholder
                    } label: {
                        Text("Ticket")
                    }
                    
                    NavigationLink {
                        BookingListView()
                    } label: {
                        Text("Bookings")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

