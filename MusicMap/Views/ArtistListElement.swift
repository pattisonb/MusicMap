//
//  ArtistListElement.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import SwiftUI
import CachedAsyncImage

struct ArtistListElement: View {
    var artist: Artist
    
    var showDate = false
    var date: Date = Date.now
    
    var body: some View {
        HStack(spacing: 12) {
            if let artistName = artist.name {
                let encodedArtistName = artistName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
                if let encodedName = encodedArtistName, let url = URL(string: "https://songleap.s3.amazonaws.com/artists/\(encodedName).png") {
                    CachedAsyncImage(
                        url: url
                    ) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                            .padding(4)
                    } placeholder: {
                        ProgressView()
                    }
                    .accessibilityIdentifier("artistPhoto")
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(artistName)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.trailing, 8)
                        .accessibilityIdentifier("artistName")
                    if showDate {
                        Text(formatDate(date: date))
                            .font(.caption)
                            .foregroundColor(.gray)
                            .accessibilityIdentifier("artistDate")
                    }
                    else {
                        Text(artist.genre!)
                            .fontWeight(.thin)
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                            .accessibilityIdentifier("artistGenre")
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
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding([.horizontal], 6)
        .background(
            !showDate ?
            NavigationLink("", destination: ArtistView(artist: artist))
                .opacity(0)
                .accessibilityIdentifier("artistLink"):
                nil
        )
    }
}
