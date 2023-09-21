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
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(venueName)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.trailing, 8)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}