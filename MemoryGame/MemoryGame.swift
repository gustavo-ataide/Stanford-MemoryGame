//
//  MemorizeGame.swift
//  MemoryGame
//
//  Created by Gustavo  Henrique on 27/11/23.
//

import Foundation

struct MemoryGame <CardContent> where CardContent: Equatable{
    private (set) var cards: Array<Card>
    
    init(NumberOfPairsOfCards: Int,CardContentFactory: (Int)->CardContent){
        cards = []
        //add NumberOfPairs Of Cards x 2 cards
        
        for pairIndex in 0..<max(2,NumberOfPairsOfCards){
            let content:CardContent = CardContentFactory(pairIndex)
            cards.append(Card(Content: content,id: "\(pairIndex+1)a"))
            cards.append(Card(Content: content,id: "\(pairIndex+1)b"))
        }
    }
    
   
    
    func choose(_ card: Card){
        
    }
    
//    mutating func faceupdown(_ card: Card){
//        card.IsFaceUp.toggle()
//    }
    
    mutating func shuffle(){
        self.cards.shuffle()
    }
    
    struct Card: Equatable, Identifiable{
        
        
        var IsFaceUp = true
        var IsMatched = false
        var Content: CardContent
        
        var id: String
        
    }
}
