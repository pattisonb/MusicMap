//
//  IntExtenstions.swift
//  MusicMap
//
//  Created by Brian Pattison on 9/21/23.
//

import Foundation
import SwiftUI

extension Int {
    func daySuffix() -> String {
        if self >= 11 && self <= 13 {
            return "th"
        }
        switch self % 10 {
        case 1:
            return "st"
        case 2:
            return "nd"
        case 3:
            return "rd"
        default:
            return "th"
        }
    }
}
