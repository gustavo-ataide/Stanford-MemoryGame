//
//  EmojiMemoryGameView.swift
//  MemoryGame
//
//  Created by Gustavo  Henrique on 21/11/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel:EmojiMemoryGame
    let emojis: [String] = ["👨🏼‍🔬","👨🏼‍⚖️","👨🏼‍💻","🧑🏼‍🏫", "👨🏼‍🍳","👨🏼‍🌾","💂🏼‍♂️","👨🏼‍🎨"]
    let foo = Int.random(in: 2...8)
    @State var Cardcount = 4
    var body: some View {
        VStack{
            ScrollView{
                Cards
            }
            
            Spacer()
            CardsAdjusters
            
        }.padding()
        
    }
    
    
    var Cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<Cardcount, id: \.self) { index in
                CardView( content: emojis[index])
            }.aspectRatio(2/3,contentMode: .fill)
                .foregroundColor(.gray)
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
        var modelview: EmojiMemoryGame
        @State var IsFaceUp:Bool = false
        let texto = "Just works"
        
        let content: String
        var body: some View{
            
            let base  = RoundedRectangle(cornerRadius: 12)
            ZStack {
                Group{
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 2)
                    VStack{
                        Text(content).font(.largeTitle)
                        Text(texto).font(.caption)
                    }
                    
                }
                .opacity(IsFaceUp ? 1 : 0)
                base.fill().opacity(IsFaceUp ? 0 : 1)
            }.onTapGesture {
                IsFaceUp.toggle()
            }
            
        }
    }
}
    #Preview {
        EmojiMemoryGameView()
    }

    

