//
//  ContentView.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .onAppear {
            getArtistPerformances(artistId: 2, fromDate: "2023-07-01", toDate: "2023-07-14") { data in
                print(data)
            }
        }
        .padding()
    }
}
