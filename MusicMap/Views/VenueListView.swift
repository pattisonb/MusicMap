//
//  VenueListElement.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import SwiftUI

struct VenueListView: View {
    @State var venues: [Venue] = []
    var body: some View {
        VStack {
            ListSelectorView()
            List {
                ForEach(venues, id: \.id) { venue in
                    VenueListElement(venue: venue, showDate: false)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(PlainListStyle())
            
        }
        .onAppear {
            NetworkRequests().getAllVenues() { data in
                if let data = data {
                    venues = data.sorted { venue1, venue2 in
                        return venue1.sortId! < venue2.sortId!
                    }
                }
            }
        }
    }
}
