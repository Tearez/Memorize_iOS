//
//  MainMenuView.swift
//  Memorize
//
//  Created by Martin Dimitrov on 27.11.20.
//

import SwiftUI

struct MainMenuView: View {
    //MARK: - Constants
    private enum Constants {
        static let navigationText = "NEW GAME"
        static let navigationTextWidth: CGFloat = 200.0
        static let navigationTextHeight: CGFloat = 100.0
        static let navigationTextBackgroundColor: Color = .white
        static let navigationTextForgroundColor: Color = .blue
        static let navigationTextShadowColor: Color = Color.gray.opacity(0.25)
        static let navigationTextCornerRadius: CGFloat = 10.0
        static let navigationTextShadowRadius: CGFloat = 5.0
    }

    var body: some View {
        let memoryGameViewModel = MemoryGameViewModel(theme: Theme.allCases.randomElement() ?? .blackWhite)
        let memoryGameView = MemoryGameView(viewModel: memoryGameViewModel)
        NavigationView {
            VStack {
                NavigationLink(destination: memoryGameView) {
                    Text(Constants.navigationText)
                        .frame(width: Constants.navigationTextWidth,
                               height: Constants.navigationTextHeight,
                               alignment: .center)
                        .background(Constants.navigationTextBackgroundColor)
                        .foregroundColor(Constants.navigationTextForgroundColor)
                        .cornerRadius(Constants.navigationTextCornerRadius)
                        .shadow(color: Constants.navigationTextShadowColor,
                                radius: Constants.navigationTextShadowRadius)
                }
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
