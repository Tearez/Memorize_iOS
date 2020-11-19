//
//  MemoryGame.swift
//  Memorize
//
//  Created by Martin Dimitrov on 19.11.20.
//

import Foundation

struct MemoryGame<T> {
    var cards: Array<Card>

//    init(numberOfPairsOfCards: Int) {
//
//    }

    func choose(card: Card) {
        print("")
    }

    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: T
    }
}
