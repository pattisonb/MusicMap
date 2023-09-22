//
//  VenueListElement.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import SwiftUI
import CachedAsyncImage

struct VenueListElement: View {
    var venue: Venue
    
    var showDate = false
    var date: Date = Date.now
    
    var body: some View {
        HStack(spacing: 12) {
            if let venueName = venue.name {
                let encodedVenueName = venueName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
                if let encodedName = encodedVenueName, let url = URL(string: "https://songleap.s3.amazonaws.com/venues/\(encodedName).png") {
                    CachedAsyncImage(
                        url: url
                    ) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                    }
                    .accessibilityIdentifier("venuePhoto")
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(showDate ? "@ " : "")\(venueName)")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.trailing, 8)
                        .accessibilityIdentifier("venueName")
                    
                    if showDate {
                        Text(formatDate(date: date))
                            .font(.caption)
                            .foregroundColor(.gray)
                            .accessibilityIdentifier("venueDate")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                if !showDate {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.blue)
                        .padding(.trailing, 4)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .background(
            !showDate ?
            NavigationLink("", destination: VenueView(venue: venue))
                .opacity(0)
                .accessibilityIdentifier("venueLink"):
                nil
        )
    }
}
