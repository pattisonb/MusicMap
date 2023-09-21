//
//  ContentView.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedList: SelectedList = .artist
    var body: some View {
        NavigationView {
            VStack {
                switch selectedList {
                case .artist:
                    ArtistListView(selectedList: $selectedList)
                case .venue:
                    VenueListView(selectedList: $selectedList)
                }
            }
            .padding()
        }
    }
}
