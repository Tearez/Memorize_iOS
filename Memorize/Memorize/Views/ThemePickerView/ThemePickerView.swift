//
//  ThemePickerView.swift
//  Memorize
//
//  Created by Martin Dimitrov on 27.11.20.
//

import SwiftUI

struct ThemePickerView: View {
    @ObservedObject private var viewModel: ThemePickerViewModel

    init(viewModel: ThemePickerViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            VStack(spacing: 10) {
                HStack {
                    Text( viewModel.isExpanded ? "Themes" : viewModel.currentlySelectedThemeTitle)
                        .padding(2.0)
                        .border(Color.black, width:1)
                }.onTapGesture {
                    viewModel.toggleIsExpanded()
                }
                if viewModel.isExpanded {
                    ForEach(viewModel.themesList.indices) { index in
                        Button(action: {
                            self.viewModel.updateCurrentlySelected(for: index)
                            viewModel.toggleIsExpanded()
                        }, label: {
                            if viewModel.isCurrentlySelected(for: index) {
                                Text(viewModel.themesList[index].rawValue)
                                    .bold()
                                    .underline()
                                    .padding(2.0)
                            } else {
                                Text(viewModel.themesList[index].rawValue)
                                    .padding(2.0)
                            }

                        }).foregroundColor(.black)
                    }
                }
            }
            .padding(5)
            .background(Color.white)
            .cornerRadius(5.0)
            .shadow(color: .gray, radius: 1.5)
            .animation(.spring())

            Spacer()
        }
    }
}

struct ThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePickerView(viewModel: ThemePickerViewModel(currentlySelectedTheme: .greyBlue))
    }
}
