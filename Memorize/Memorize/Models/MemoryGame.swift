//
//  MemoryGame.swift
//  Memorize
//
//  Created by Martin Dimitrov on 19.11.20.
//

import Foundation

struct MemoryGame<T: Equatable> {
    private let mistakePoints: Int = -1
    private let matchPoints: Int = 2
    private var indexOfFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }

    private(set) var points: Int
    private(set) var cards: Array<Card>

    init(contentArray: [T]) {
        cards = Array<Card>()
        for index in contentArray.indices {
            cards.append(Card(id: index*2, content: contentArray[index]))
            cards.append(Card(id: index*2 + 1, content: contentArray[index]))
        }
        cards.shuffle()
        points = 0
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
                addPoints()
            } else {
                if cards[index].hasBeenSeen {
                    substractPoints()
                } else {
                    cards[index].hasBeenSeen = true
                }
            }
            cards[index].isFaceUp = true
        } else {
            indexOfFaceUpCard = index
            cards[index].hasBeenSeen = true
        }
    }

    private mutating func substractPoints() {
        updatePoints(by: mistakePoints)
    }

    private mutating func addPoints() {
        updatePoints(by: matchPoints)
    }

    private mutating func updatePoints(by amount: Int) {
        points = points + amount
    }

    struct Card: Identifiable {
        var id: Int

        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var hasBeenSeen: Bool = false
        var content: T
    }
}
