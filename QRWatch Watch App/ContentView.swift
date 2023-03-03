//
//  ContentView.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 2/28/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
        @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Image(systemName: "photo.fill")
                    Text("ParkRoll").frame(maxWidth: .infinity,alignment: .trailing).foregroundColor(.green)
                }
                
                ScrollView{
                    
                    Text("\(viewModel.getTimeRemaining(timeOfParking: viewModel.getBookings()[0].date, duration: viewModel.getBookings()[0].duaration))\n hours left").frame(maxWidth: .infinity,alignment: .leading).font(.title)
                    
                    NavigationLink {
                        Text("QR Code") //Placeholder
                    } label: {
                        Text("Ticket")
                    }
                    
                    NavigationLink {
                        Bookings()
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

struct Bookings: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        
        List(viewModel.getBookings()){ booking in
            if (booking.date + (booking.duaration*3600)) >= Date(){
                Section("Current Parking") {
                    NavigationLink {
                        SpotView(booking: booking)
                    } label: {
                        HStack{
                            Text(booking.place)
                        }
                    }
                }
                
            }else{
                
                Section("Past Parking") {
                    NavigationLink {
                        SpotView(booking: booking)
                    } label: {
                        Text(booking.place)
                    }
                    
                }
            }
        }
    }
}

struct SpotView: View {
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    let booking: BookingModel
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            VStack{
                Text("Parking at \(booking.place)")
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                Text("Until: \(viewModel.getParkEndHour(timeOfParking: booking.date, duration: booking.duaration))")
                    .frame(maxWidth: .infinity,alignment: .trailing)
            }
            Map(coordinateRegion: $region,interactionModes: .zoom)
        }
    }
}
