//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by Martin Dimitrov on 19.11.20.
//

import Foundation

class MemoryGameViewModel: ObservableObject {
    //MARK: - Private Properties
    @Published private var memoryGame: MemoryGame<String> = MemoryGame<String>(contentArray: [ "👻", "🚀", "🧠", "🤬", "👿", "🐉" ])

    //MARK: - Public Properties
    var cards: Array<MemoryGame<String>.Card> {
        return memoryGame.cards
    }

    //MARK: - Intents
    func choose(card: MemoryGame<String>.Card) {
        memoryGame.choose(card: card)
    }
}
