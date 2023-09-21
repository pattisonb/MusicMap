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
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(artistName)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.trailing, 8)
                    Text(artist.genre!)
                        .fontWeight(.thin)
                        .foregroundColor(.secondary)
                        .padding(.trailing, 8)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.blue)
                    .padding(.trailing, 4)
            }
        }
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .padding([.horizontal], 6)
        .background(NavigationLink("", destination: ArtistView(artist: artist)).opacity(0))
    }
}
