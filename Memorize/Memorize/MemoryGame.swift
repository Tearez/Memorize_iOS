//
//  MemoryGame.swift
//  Memorize
//
//  Created by Martin Dimitrov on 19.11.20.
//

import Foundation

struct MemoryGame<T> {
    var cards: Array<Card>

    init(contentArray: [T]) {
        cards = Array<Card>()
        for index in contentArray.indices {
            cards.append(Card(id: index*2, content: contentArray[index]))
            cards.append(Card(id: index*2 + 1, content: contentArray[index]))
        }
        cards.shuffle()
    }

    mutating func choose(card: Card) {
        guard let index = self.index(of: card) else {
            return
        }
        cards[index].isFaceUp = !cards[index].isFaceUp
    }

    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }

    struct Card: Identifiable {
        var id: Int

        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: T
    }
}
