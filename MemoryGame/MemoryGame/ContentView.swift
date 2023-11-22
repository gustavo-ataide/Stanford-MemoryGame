//
//  ContentView.swift
//  MemoryGame
//
//  Created by Gustavo  Henrique on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack{
            CardView(IsFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundStyle(.tint)
        .padding()
    }
}
struct CardView: View{
    @State var IsFaceUp:Bool = false
    let texto = "Just works"
    var body: some View{
        
        let base  = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if IsFaceUp{
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                VStack{
                    Text("👨🏼‍💻").font(.largeTitle)
                    Text(texto).font(.caption)
                }
                
            }else{
                base.fill()
            }
        }.onTapGesture {
            IsFaceUp.toggle()
        }
        
    }
}

#Preview {
    ContentView()
}
