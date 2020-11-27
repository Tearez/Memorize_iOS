//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Martin Dimitrov on 19.11.20.
//

import SwiftUI

struct MemoryGameView: View {
    //MARK: - Constants
    private enum Constants {
        static let padding: CGFloat = 6.0
        static let cardViewAspectRatio: CGFloat = 2/3
    }

    @ObservedObject private var viewModel: MemoryGameViewModel

    init(viewModel: MemoryGameViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            HStack() {
                GridView(items: viewModel.cards) { card in
                    CardView(card: card, theme: viewModel.theme).onTapGesture {
                        viewModel.choose(card: card)
                    }
                    .padding(Constants.padding)
                }
            }
            .padding(Constants.padding)
            .foregroundColor(.orange)

            HStack {
                Text(viewModel.themeName)
                Spacer()
                Button(action: {
                    viewModel.resetGame()
                }, label: {
                    Text("Reset Game")
                        .foregroundColor(.black)
                })
                Spacer()
                Text(viewModel.points)
            }
            .padding(Constants.padding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MemoryGameView(viewModel: MemoryGameViewModel(theme: .blackWhite))
        }
    }
}
