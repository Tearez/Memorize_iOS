//
//  MemoryGame.swift
//  Memorize
//
//  Created by Martin Dimitrov on 19.11.20.
//

import Foundation

struct MemoryGame<T: Equatable> {
    var cards: Array<Card>
    var indexOfFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }

    init(contentArray: [T]) {
        cards = Array<Card>()
        for index in contentArray.indices {
            cards.append(Card(id: index*2, content: contentArray[index]))
            cards.append(Card(id: index*2 + 1, content: contentArray[index]))
        }
        cards.shuffle()
    }

    mutating func choose(card: Card) {
        guard let index = cards.firstIndex(of: card),
              !cards[index].isFaceUp,
              !cards[index].isMatched else {
            return
        }
        if let potentialMatchedIndex = indexOfFaceUpCard {
            if cards[index].content == cards[potentialMatchedIndex].content {
                cards[index].isMatched = true
                cards[potentialMatchedIndex].isMatched = true
            }
            self.cards[index].isFaceUp = true
        } else {
            indexOfFaceUpCard = index
        }
    }

    struct Card: Identifiable {
        var id: Int

        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: T
    }
}
