//
//  ContentView.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VenueListView()
        }
        .background(Color("background"))
        .padding()
    }
}
