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
        HStack {
            if let artistName = artist.name {
                let encodedArtistName = artistName.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
                if let encodedName = encodedArtistName, let url = URL(string: "https://songleap.s3.amazonaws.com/artists/\(encodedName).png") {
                    CachedAsyncImage(
                        url: url
                    ) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .clipShape(Rectangle())
                    } placeholder: {
                        ProgressView()
                    }
                }
                VStack (alignment: .leading) {
                    Text(artistName)
                        .bold()
                    Text(artist.genre!)
                        .fontWeight(.thin)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
