//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Martin Dimitrov on 19.11.20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            MemoryGameView(viewModel: MemoryGameViewModel())
        }
    }
}
