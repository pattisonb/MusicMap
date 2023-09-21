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
        ZStack {
            List {
                ForEach(venues, id: \.id) { venue in
                    VenueListElement(venue: venue)
                }
            }
        }
        .onAppear {
            getAllVenues() { data in
                if let data = data {
                    venues = data.sorted { venue1, venue2 in
                        return venue1.sortId! < venue2.sortId!
                    }
                }
            }
        }
    }
}
