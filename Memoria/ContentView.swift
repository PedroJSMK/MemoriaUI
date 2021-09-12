//
//  ContentView.swift
//  Memoria
//
//  Created by Pedro Kanagusto on 07/08/21.
//

import SwiftUI

struct ContentView: View {
    var emojis =  ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚜", "🛺", "🚨", "🚔", "🚍", "🚘", "🚖", "🚡", "🚠", "🚟", "🚃", "🚅", "✈️", "🚋"]

   @State var emojiCount = 6
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem()]) {
                ForEach(emojis[0..<emojiCount],  id: \.self)  { emoji in
                    CardView(content: emoji).aspectRatio(2/3,contentMode: .fit)
                }
            }
            .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
   
}
    


struct CardView: View {
    var content: String
    @State var isfaceUp: Bool = true
    
        var body: some View {
            ZStack {
                let shope = RoundedRectangle(cornerRadius: 20)
                if isfaceUp {
                    shope.fill().foregroundColor(.white)
                    shope.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
                } else {
                    shope.fill()
                }
            }
            .onTapGesture {
               isfaceUp = !isfaceUp
            }
        }
}
    

























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
