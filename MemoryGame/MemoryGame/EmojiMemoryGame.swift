//
//  EmojiMemorizeGame.swift
//  MemoryGame
//
//  Created by Gustavo  Henrique on 08/12/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👨🏼‍🔬","👨🏼‍⚖️","👨🏼‍💻","🧑🏼‍🏫", "👨🏼‍🍳","👨🏼‍🌾","💂🏼‍♂️","👨🏼‍🎨"]
    
    @Published private var Model = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame()-> MemoryGame<String>{
        return MemoryGame(NumberOfPairsOfCards:11) { pairIndex in
            if emojis.indices.contains(pairIndex){
                return EmojiMemoryGame.emojis[pairIndex]
            }else{
                return "⁉️"
            }
            
        }
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        Model.choose(card)
    }
    
//    func faceupdown (_ card: MemoryGame<String>.Card){
//        Model.faceupdown(card)
//    }
    
    var cards: Array<MemoryGame<String>.Card>{
        return Model.cards
    }
    
    // MARK: - Intents
    
    func shuffle(){
        Model.shuffle()
    }
    
}
