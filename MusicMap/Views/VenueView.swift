//
//  VenueView.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import SwiftUI
import CachedAsyncImage

struct VenueView: View {
    
    var venue: Venue
    
    @State var performances: [VenuePerformance] = []
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                let encodedArtistName = venue.name!.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
                if let encodedName = encodedArtistName, let url = URL(string: "https://songleap.s3.amazonaws.com/venues/\(encodedName).png") {
                    CachedAsyncImage(
                        url: url
                    ) { image in
                        image
                            .resizable()
                            .frame(maxHeight: 250)
                            .blur(radius: 10)
                    } placeholder: {
                        ProgressView()
                    }
                }
                Text(venue.name!)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(16)
                    .shadow(color: .black, radius: 5, x: 0, y: 2)
            }
            Text("Upcoming Performances")
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top, 12)
                .underline()
            List {
                ForEach(performances, id: \.id) { performance in
                    ArtistListElement(artist: performance.artist!, showDate: true, date: performance.date!)
                }
            }
            .listStyle(PlainListStyle())
            .padding(.top, 16)
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            let today = Date.now
            let twoWeeks = Date.now.addingTimeInterval(1209600)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            let todayString = dateFormatter.string(from: today)
            let twoWeeksString = dateFormatter.string(from: twoWeeks)
            
            NetworkRequests().getVenuePerformances(venueId: venue.id!, fromDate: todayString, toDate: twoWeeksString) { data in
                if let data = data {
                    performances = data
                    performances.sort { $0.date! < $1.date! }
                }
            }
        }
    }
}
