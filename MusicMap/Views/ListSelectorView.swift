//
//  ListSelectorView.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import SwiftUI

enum SelectedList {
    case artist
    case venue
}

struct ListSelectorView: View {
    
    @Binding var selectedList: SelectedList
    
    var body: some View {
        HStack {
            Button(action: {
                selectedList = .artist
            }) {
                Text("Artists")
                    .padding()
                    .background(selectedList == .artist ? Color.blue : Color.clear)
                    .foregroundColor(selectedList == .artist ? Color.white : Color.blue)
                    .cornerRadius(8)
            }
            
            Button(action: {
                selectedList = .venue
            }) {
                Text("Venues")
                    .padding()
                    .background(selectedList == .venue ? Color.blue : Color.clear)
                    .foregroundColor(selectedList == .venue ? Color.white : Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}
