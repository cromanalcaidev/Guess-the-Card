//
//  ContentView.swift
//  Guess the Card
//
//  Created by Carlos Román Alcaide on 29/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cards = [
        ["🍀", "💎", "❤️"].shuffled(),
        ["♠️", "♦️", "♣️"].shuffled(),
        ["🌟", "🌈", "🌙"].shuffled(),
        ["☀️", "🌀", "🍄"].shuffled()]
    
    @State private var luckyRow = Int.random(in: 0...3)
    @State private var luckyCard = Int.random(in: 0...2)
    @State private var isTapped = false
    @State private var isRight = false
    @State private var buttonTxt: String = ""

    
    var body: some View {
        
        ZStack {
            VStack {
                Text("\(cards[luckyRow][luckyCard])")
                    .font(.system(size: 80))
                
                ForEach(0..<cards.count, id:\.self) {row in
                    HStack {
                        ForEach(0..<cards[row].count, id:\.self) { card in
                            Button {
                                tapButton(row: row, card: card)
                            } label: {
                                
                                isTapped == true ? Text("\(cards[row][card])") : Text("Hello")
                            }
                            .padding(5)
                        }
                    }
                    .padding(5)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.indigo)
    }
    
    func tapButton(row: Int, card: Int) {
        
        isTapped = true
        
        if row == luckyRow && card == luckyCard {
            isRight = true
            print("yay")
        } else {
            isRight = false
        }
    }
    
}

#Preview {
    ContentView()
}
