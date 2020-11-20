//
//  MemoryGameView.swift
//  Memorize
//
//  Created by Martin Dimitrov on 19.11.20.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject private var viewModel: MemoryGameViewModel

    init(viewModel: MemoryGameViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: MemoryGameViewModel())
    }
}
