//
//  CardView.swift
//  Memorize
//
//  Created by Martin Dimitrov on 19.11.20.
//

import SwiftUI

struct CardView: View {
    //MARK: - Constants
    private enum Constants {
        static let cornerRadius:CGFloat = 10.0
        static let fontSizeMultiplier: CGFloat = 0.75
        static let strokeWidth: CGFloat = 3.0
    }
    let card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: Constants.cornerRadius).stroke(lineWidth: Constants.strokeWidth)
                    Text("\(card.content)")
                } else {
                    RoundedRectangle(cornerRadius: Constants.cornerRadius).fill()
                }
            }
            .font(Font.system(size: getFontSize(for: min(geometry.size.width, geometry.size.height))))
        }
    }

    private func getFontSize(for size: CGFloat) -> CGFloat {
        return size * Constants.fontSizeMultiplier
    }
}

struct CardView_Previews: PreviewProvider {
    private static let card: MemoryGame<String>.Card = MemoryGame<String>.Card(id: 0, content: "😕")
    static var previews: some View {
        CardView(card: card)
    }
}
