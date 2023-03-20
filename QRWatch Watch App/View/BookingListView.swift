//
//  BookingListView.swift
//  QRWatch Watch App
//
//  Created by Corey Edh on 3/3/23.
//

import SwiftUI
import MapKit

struct BookingListView<Model>: View where Model: ViewModelProtocol {
    @StateObject var viewModel: Model
    
    var body: some View {
        
        List{
            
            //
            if !viewModel.currentBookings.isEmpty{
                Section("Upcoming Parking") {
                    //
                    ForEach(viewModel.currentBookings) { booking in
                        NavigationLink {
                            UpComingSpotView(booking: booking)
                        } label: {
                            HStack{
                                Image(systemName: "clock.fill").resizable().frame(width: 50, height: 50)
                                
                                Spacer()
                                VStack{
                                    Text(booking.place).frame(maxWidth: .infinity,alignment:.trailing)
                                    Text("On \(viewModel.getParkTime(timeOfParking: booking.date))")                              .scaledToFit().minimumScaleFactor(0.5).font(.caption)
                                        .frame(maxWidth: .infinity,alignment:.trailing)
                                }
                            }
                        }
                    }
                    
                }
                
            }
            
            if !viewModel.pastBookings.isEmpty{
                Section("Book Again"){
                    ForEach(viewModel.pastBookings) { booking in
                        HStack{
                            Button {
                                //rebook
                                print("hi")
                            } label: {
                                Image(systemName: "arrow.clockwise")
                                    .frame(width: 50, height: 50).background(.green).clipShape(Circle())
                            }


                            NavigationLink {
                                PreviousSpotView(booking: booking)
                            } label: {
                                HStack{
                                    
                                    Spacer()
                                    VStack{
                                        
                                        Text(booking.place).frame(maxWidth: .infinity,alignment:.trailing)
                                        VStack{
                                            Text(viewModel.getParkTime(timeOfParking: booking.date))
                                                .scaledToFit().minimumScaleFactor(0.5).frame(maxWidth: .infinity,alignment:.trailing)
                                            
                                            Text("\(booking.duaration,specifier: "%.1f") hours").scaledToFit().minimumScaleFactor(0.5).frame(maxWidth: .infinity,alignment:.trailing)
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        }.onAppear{
            viewModel.getBookingHistory()
        }
        
    }
}


struct UpComingSpotView: View {
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900, longitude: -122.009_020),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    let booking: BookingModel
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        ScrollView{
            VStack{
                ZStack{
                    Image("city").resizable().frame(maxHeight: .infinity).scaledToFit().opacity(0.3).clipShape(RoundedRectangle(cornerRadius: 16))
                    VStack{
                        HStack{
                            Image("logo").resizable().scaledToFit().frame(height: 30).cornerRadius(5)
                            Text("ParkRoll").foregroundColor(.green).minimumScaleFactor(0.5)
                        }.frame(maxWidth: .infinity)
                        
                      //  Text("\(viewModel.getParkTime(timeOfParking: booking.date))") .frame(maxWidth: .infinity).scaledToFit().minimumScaleFactor(0.5)
                        
                        Text("to").font(.system(size: 10))
                        
                       // Text("\(viewModel.getParkTime(timeOfParking: booking.date + (booking.duaration * 3600)))").frame(maxWidth: .infinity).scaledToFit().minimumScaleFactor(0.5)
                        
                       
                        
                    }.frame(maxWidth: .infinity,alignment: .trailing)
                    
                }
                Spacer().frame(height: 50)
                
                Image("QRcode").resizable().frame(width: 200, height: 200)
                Spacer().frame(height: 50)
                
                Text("Where \(booking.place)").frame(maxWidth: .infinity, alignment: .leading).scaledToFit().minimumScaleFactor(0.5)
                
                Map(coordinateRegion: $region,interactionModes: .zoom).frame(width: 200,height: 100)
            }
        }
    }
}

struct PreviousSpotView: View {
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
                Text("Parking at \(booking.place)").frame(alignment: .trailing)
                
                Text("from \(viewModel.getParkEndHour(timeOfParking: booking.date, duration:0)) to  \(viewModel.getParkEndHour(timeOfParking: booking.date, duration: booking.duaration))").scaledToFit().minimumScaleFactor(0.5)
                
            }.frame(maxWidth: .infinity,alignment: .trailing)
            Text("Location:")
            Map(coordinateRegion: $region,interactionModes: .zoom)
        }
    }
    
}


struct BookingListView_Previews: PreviewProvider {
    static var previews: some View {
        BookingListView()
        UpComingSpotView(booking: ViewModel().getBookings()[0])
    }
}
