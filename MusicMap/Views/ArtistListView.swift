//
//  ArtistListView.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import SwiftUI

struct ArtistListView: View {
    
    @State var artists: [Artist] = []
    
    var body: some View {
        ZStack {
            List {
                ForEach(artists, id: \.id) { artist in
                    ArtistListElement(artist: artist)
                }
            }
        }
        .onAppear {
            getAllArtists() { data in
                if let data = data {
                    artists = data
                }
            }
        }
    }
        
}
