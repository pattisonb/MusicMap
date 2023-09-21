//
//  ContentView.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var musicMapVM: MusicMapVM
    var body: some View {
        NavigationView {
            VStack {
                switch musicMapVM.selectedList {
                case .artist:
                    ArtistListView()
                case .venue:
                    VenueListView()
                }
            }
            .padding()
        }
    }
}
