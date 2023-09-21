//
//  ListSelectorView.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import SwiftUI

struct ListSelectorView: View {
    
    @EnvironmentObject var musicMapVM: MusicMapVM
    
    var body: some View {
        HStack {
            Button(action: {
                musicMapVM.selectedList = .artist
            }) {
                Text("Artists")
                    .padding()
                    .background(musicMapVM.selectedList == .artist ? Color.blue : Color.clear)
                    .foregroundColor(musicMapVM.selectedList == .artist ? Color.white : Color.blue)
                    .cornerRadius(8)
            }
            
            Button(action: {
                musicMapVM.selectedList = .venue
            }) {
                Text("Venues")
                    .padding()
                    .background(musicMapVM.selectedList == .venue ? Color.blue : Color.clear)
                    .foregroundColor(musicMapVM.selectedList == .venue ? Color.white : Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}
