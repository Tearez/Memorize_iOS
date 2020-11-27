//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Martin Dimitrov on 19.11.20.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    //MARK: - Private Properties
    @Published private var memoryGame: MemoryGame<String>
    @Published private(set) var theme: Theme


    init(theme: Theme) {
        self.theme = theme
        memoryGame = MemoryGame(contentArray: theme.itemsList)
    }

    //MARK: - Public Properties
    var cards: Array<MemoryGame<String>.Card> {
        return memoryGame.cards
    }

    var themeName: String {
        return theme.rawValue
    }

    var points: String {
        return "Points: \(memoryGame.points)"
    }

    var cardColor: Color {
        return theme.cardBackColor
    }

    //MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        memoryGame.choose(card: card)
    }

    func resetGame() {
        guard let theme = Theme.allCases.randomElement() else {
            return
        }
        memoryGame = MemoryGame(contentArray: theme.itemsList)
        self.theme = theme
    }
}
