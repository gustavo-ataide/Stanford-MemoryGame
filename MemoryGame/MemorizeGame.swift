//
//  MemorizeGame.swift
//  MemoryGame
//
//  Created by Gustavo  Henrique on 27/11/23.
//

import Foundation

struct MemoryGame <CardContent>{
    var cards: Array<Card>
    
    func choose(card: Card){
        
    }
    
    
    struct Card{
        var IsFaceUp: Bool
        var IsMatched: Bool
        var Content: CardContent
        
    }
}
