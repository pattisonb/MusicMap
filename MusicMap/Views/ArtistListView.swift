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
        VStack {
            ListSelectorView()
            List {
                ForEach(artists, id: \.id) { artist in
                        ArtistListElement(artist: artist)
                            .listRowSeparator(.hidden)
                }
            }
            .listStyle(PlainListStyle())
        }
        .onAppear {
            NetworkRequests().getAllArtists() { data in
                if let data = data {
                    artists = data
                    artists.sort { (artist1, artist2) -> Bool in
                        return artist1.name?.localizedCaseInsensitiveCompare(artist2.name ?? "") == .orderedAscending
                    }
                }
            }
        }
    }
        
}
