//
//  EmojiMemoryGame.swift
//  Memoria
//
//  Created by Pedro Kanagusto on 05/08/21.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    @Published private var model: MemoryGame<String>
    private(set) var theme: EmojiMemoryTheme

    init(theme: EmojiMemoryTheme? = nil) {
        self.theme = theme ?? EmojiMemoryTheme.themes.randomElement()!
        let emoji = self.theme.emoji.shuffled()
        model = MemoryGame(numberOfPairsOfCards: self.theme.numberOfPairs) { emoji[$0] }
    }

    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    var score: Int {
        model.score
    }

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

    func restart() {
        let emoji = theme.emoji.shuffled()
        let numberOfPairs: Int = theme.numberOfPairs
        model = MemoryGame(numberOfPairsOfCards: numberOfPairs) { emoji[$0] }
    }
}
