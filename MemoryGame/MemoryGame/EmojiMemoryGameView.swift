//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Gustavo  Henrique on 21/11/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    let emojis: [String] = ["👨🏼‍🔬","👨🏼‍⚖️","👨🏼‍💻","🧑🏼‍🏫", "👨🏼‍🍳","👨🏼‍🌾","💂🏼‍♂️","👨🏼‍🎨"]
    let foo = Int.random(in: 2...8)
    @State var Cardcount = 4
    var body: some View {
        VStack{
            ScrollView{
                Cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
            
//            Spacer()
            CardsAdjusters
            
        }.padding()
        
    }
    
    
    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3,contentMode: .fill)
                        .foregroundColor(.gray)
                        .padding(4)
            }
        }
    }
    
    
    var CardsAdjusters: some View{
        HStack{
            cardRemover
            
            Spacer()
            
            CardAdd
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol:String) -> some View{
        Button(action: {
            Cardcount += offset
        },label: {
            Image(systemName: symbol)
        })
        .disabled(Cardcount + offset < 1 || Cardcount + offset > emojis.count)
        
    }
    
    var cardRemover: some View {
        return cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var CardAdd: some View {
        return cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
    
    
    struct CardView: View{
//        var modelview: EmojiMemoryGame
        let card:MemoryGame<String>.Card
        
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
        
        var body: some View{
            
            let base  = RoundedRectangle(cornerRadius: 12)
            ZStack {
                Group{
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(card.Content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1,contentMode: .fit)
                    
                }
                .opacity(card.IsFaceUp ? 1 : 0)
                base.fill().opacity(card.IsFaceUp ? 0 : 1)
            }
//            .onTapGesture {
//                EmojiMemoryGame.faceupdown(self)
//            }
            
        }
    }
}
    #Preview {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }


