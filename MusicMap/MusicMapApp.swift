//
//  MusicMapApp.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/20/23.
//

import SwiftUI

@main
struct MusicMapApp: App {
    
    @StateObject var musicMapVM = MusicMapVM()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(musicMapVM)
        }
    }
}
