//
//  EmojiMemoryTheme.swift
//  Memoria
//
//  Created by Pedro Kanagusto on 09/08/21.
//

import Foundation
import SwiftUI

struct EmojiMemoryTheme: Codable, Identifiable {
    var id: String { name }
    let name: String
    let emoji: [String]
    let colorRGB: UIColor.RGB
    let numberOfPairs: Int

    var color: Color {
        Color(colorRGB)
    }

    var json: Data? {
        try? JSONEncoder().encode(self)
    }

    init(name: String, emoji: [String], colorRGB: UIColor.RGB, numberOfPairs: Int) {
        self.name = name
        self.emoji = emoji
        self.colorRGB = colorRGB
        self.numberOfPairs = numberOfPairs
    }

    init?(json: Data?) {
        if let json = json, let newEmojiTheme = try? JSONDecoder().decode(EmojiMemoryTheme.self, from: json) {
            self = newEmojiTheme
        }
        else {
            return nil
        }
    }

    static var themes: [EmojiMemoryTheme] = [
        EmojiMemoryTheme(name: "Animais", emoji: ["🐶","🐯","🐱","🐭","🦊","🐻","🐼","🐷","🐨","🐵","🦁", "🐔"], colorRGB: UIColor.blue.rgb, numberOfPairs: 8),
        EmojiMemoryTheme(name: "Halloween", emoji: ["👻","🎃","🧟","🕷","🕸", "🦇", "🪓", "🔪", "⛓", "⚰️"], colorRGB: UIColor.orange.rgb, numberOfPairs: 6),
        EmojiMemoryTheme(name: "Naipes", emoji: ["♠️","♣️","♥️","♦️"], colorRGB: UIColor.gray.rgb, numberOfPairs: 4),
        EmojiMemoryTheme(name: "Esportes", emoji: ["⚽️","🏀","🏈","⚾️","🎾","🏐","🎱", "🏉", "🏓", "🥎", "🥇", "🏆"], colorRGB: UIColor.red.rgb, numberOfPairs: 6),
        EmojiMemoryTheme(name: "Comidas", emoji: ["🍏","🍎","🍊","🍋","🍌","🥑","🥝","🍇","🍐","🍓","🍒","🍉"], colorRGB: UIColor.blue.rgb, numberOfPairs: 8),
        EmojiMemoryTheme(name: "Veiculos", emoji: ["🚕","🚌","🚓","🚑","🚒","🚜","🚚","🚛","🚠","🚋","🚄","✈️","🛳","🚁","🚂"], colorRGB: UIColor.purple.rgb, numberOfPairs: 5),
        EmojiMemoryTheme(name: "Faces", emoji: ["😃","😂","😍","🙃","😇","😎","🤓","🤩",
                                                "🤬","🥶","🤢","🤠","😷","🤕","😱","😜",
                                                "🥵","🤡","💩","🥳"],
                         colorRGB: UIColor.systemPink.rgb, numberOfPairs: 7),
    ]

    static let template = EmojiMemoryTheme(name: "Untitled", emoji: ["😃", "👍🏻", "🌈", "❤️"], colorRGB: UIColor.systemGreen.rgb, numberOfPairs: 4)
}
