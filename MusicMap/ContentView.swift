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
            getAllPerformances() { data in
                print(data)
            }
        }
        .padding()
    }
}
