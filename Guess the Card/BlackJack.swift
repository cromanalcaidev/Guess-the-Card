//
//  BlackJack.swift
//  Guess the Card
//
//  Created by Carlos Román Alcaide on 30/3/24.
//

import SwiftUI

struct BlackJack: View {
    
    enum Value: String {
        case A = "A"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case J = "J"
        case Q = "Q"
        case K = "K"
    }
    
    @State private var cardValues = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K"]
    @State private var suits = ["♣️", "♥️", "♠️", "♦️"]
    
    @State private var fullDeck = [String]()
    @State private var playerCards = [String]()
    
    @State private var houseResult = 0
    @State private var playerResult = 0
    @State private var isFirstCard = true
    @State private var cardText = ""
    @State private var turn = 0
    @State private var round = 0
    @State private var points = 0
    
    
    var body: some View {
        
        Spacer()
        
        HStack {
            Button {
                shuffle()
            } label: {
                Text("Shuffle deck")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
            .frame(width: 120, height: 40)
            .background(.blue)
            .cornerRadius(8)
            .padding()
            
            Button {
                deal()
            } label: {
                Text("Deal a card")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
            .frame(width: 120, height: 40)
            .background(.blue)
            .cornerRadius(8)
            .padding()
        }
        
        Spacer()
        
        Section {
            CardView(name: cardText)
        }
        
        Spacer()
        
        Section {
            HStack {
                ForEach(playerCards, id: \.self) {card in
                    CardView(name: card)
                }
            }
        }
        
        Spacer()
        
    }
    
    func count() {
        
        for card in playerCards {
            switch card {
            case "A♠️", "A♣️", "A♥️", "A♦️":
                points += 11
            case "2♠️", "2♣️", "2♥️", "2♦️":
                points += 2
            case "3♠️", "3♣️", "3♥️", "3♦️":
                points += 3
            case "4♠️", "4♣️", "4♥️", "4♦️":
                points += 4
            case "5♠️", "5♣️", "5♥️", "5♦️":
                points += 5
            case "6♠️", "6♣️", "6♥️", "6♦️":
                points += 6
            case "7♠️", "7♣️", "7♥️", "7♦️":
                points += 7
            case "8♠️", "8♣️", "8♥️", "8♦️":
                points += 8
            case "9♠️", "9♣️", "9♥️", "9♦️":
                points += 9
            case "J♠️", "J♣️", "J♥️", "J♦️":
                points += 10
            case "Q♠️", "Q♣️", "Q♥️", "Q♦️":
                points += 10
            case "K♠️", "K♣️", "K♥️", "K♦️":
                points += 10
            default:
                print("nothing")
            }
        }
        
    }
    
    func blackJack() {
        //
    }
    
    func deal() {
        
        if points == 21 {
            blackJack()
            print(points)
            print("blackjack!")
        } else if points > 21 {
            print(points)
            print("You lost")
        } else {
            if isFirstCard {
                cardText = "\(fullDeck[turn])"
                playerCards.append(fullDeck[turn])
                turn += 1
                isFirstCard = false
                print(points)
            } else {
                turn += 1
                cardText = "\(fullDeck[turn])"
                playerCards.append(fullDeck[turn])
                print(points)
            }
            count()
        }
    }
    
    func shuffle() {
        round += 1
        fullDeck = [String]()
        for cardValue in cardValues {
            for suit in suits {
                fullDeck.append(cardValue + suit)
            }
        }
        fullDeck.shuffle()
    }
}

#Preview {
    BlackJack()
}
