//
//  Date.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import Foundation
import SwiftUI


func formatDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM d"
    
    let day = Calendar.current.component(.day, from: date)
    let suffix = day.daySuffix()
    let monthAndDay = dateFormatter.string(from: date)
    
    return "on \(monthAndDay)\(suffix)"
}
