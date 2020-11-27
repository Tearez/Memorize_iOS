//
//  ThemePickerViewModel.swift
//  Memorize
//
//  Created by Martin Dimitrov on 27.11.20.
//

import SwiftUI

class ThemePickerViewModel: ObservableObject {
    private(set) var currentlySelected: Theme
    @Published private(set) var isExpanded: Bool = false

    let themesList: [Theme] = Theme.allCases

    init(currentlySelectedTheme: Theme) {
        self.currentlySelected = currentlySelectedTheme
    }

    var currentlySelectedThemeTitle: String {
        currentlySelected.rawValue
    }

    func toggleIsExpanded() {
        isExpanded.toggle()
    }

    func isCurrentlySelected(for index: Int) -> Bool {
        return currentlySelected == themesList[index]
    }

    func updateCurrentlySelected(for index: Int) {
        self.currentlySelected = themesList[index]
    }
}
