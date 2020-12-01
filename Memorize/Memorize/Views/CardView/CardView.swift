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
    private let card: MemoryGame<String>.Card
    private let theme: Theme

    init(card: MemoryGame<String>.Card, theme: Theme) {
        self.card = card
        self.theme = theme
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                PieChartView(startAngle: Angle.degrees(0 - 90),
                             endAngle: Angle.degrees(110 - 90),
                             clockwise: true)
                    .foregroundColor(theme.cardBackColor)
                    .padding(15)
                    .opacity(0.4)
                Text("\(card.content)")
//                if card.isFaceUp {
//                    RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(Color.white)
//                    RoundedRectangle(cornerRadius: Constants.cornerRadius)
//                        .strokeBorder(theme.cardBackColor, lineWidth: 5)
//                } else {
//                    if !card.isMatched {
//                        RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(theme.cardBackColor)
//                    }
//                }
            }
            .font(Font.system(size: getFontSize(for: min(geometry.size.width, geometry.size.height))))
        }
    }

    private func getFontSize(for size: CGFloat) -> CGFloat {
        return size * Constants.fontSizeMultiplier
    }
}

struct CardView_Previews: PreviewProvider {
    private static var card: MemoryGame<String>.Card = MemoryGame<String>.Card(id: 0, content: "😕")
    static var previews: some View {
        card.isFaceUp = true
        return CardView(card: card, theme: .halloween)
    }
}
