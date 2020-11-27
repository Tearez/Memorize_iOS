//
//  ThemeManager.swift
//  Memorize
//
//  Created by Martin Dimitrov on 27.11.20.
//

import SwiftUI

enum Theme: String, CaseIterable {
    case blackWhite = "Black & White"
    case greyBlue = "Gray & Blue"
    case christmas = "Christmas"
    case halloween = "Halloween"

    var itemsList: [String] {
        switch self {
            case .blackWhite:
                return ["🐼", "👀", "☕️", "🦷", "🐑", "⚪️"]
            case .christmas:
                return ["🎅🏻", "❄️", "⛄️", "🧑🏻‍🎄", "🎁", "🎄"]
            case .greyBlue:
                return ["🐨", "🐺", "🧦", "🥶", "🐠", "🐳"]
            case .halloween:
                return ["👽", "🧚‍♂️", "🎃", "🤡", "🤖", "👿"]
        }
    }

    var cardBackColor: Color {
        switch self {
            case .blackWhite:
                return .blue
            case .greyBlue:
                return .gray
            case .christmas:
                return .red
            case .halloween:
                return .orange
        }
    }
}
