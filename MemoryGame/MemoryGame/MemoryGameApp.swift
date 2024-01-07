//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Gustavo  Henrique on 21/11/23.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
