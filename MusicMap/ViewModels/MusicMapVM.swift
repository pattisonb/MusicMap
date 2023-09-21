//
//  MusicMapVM.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import Foundation


enum SelectedList {
    case artist
    case venue
}

final class MusicMapVM: ObservableObject {
    @Published var selectedList: SelectedList = .artist
}
