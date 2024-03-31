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
    @State private var houseCards = [String]()
    
    @State private var houseResult = 0
    @State private var playerResult = 0
    @State private var isFirstCard = true
    @State private var cardText = ""
    @State private var turn = 0
    @State private var round = 0
    @State private var playerCount = 0
    
    @State private var showShuffle = true
    @State private var isBlackJack = false
    @State private var isOver21 = false
    @State private var playerStands = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Spacer()
                Spacer()
                
                showShuffle ? Button {
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
                
                :
                
                Button {
                    //
                } label: {
                    Text("")
                        .font(.system(size: 18))
                        .foregroundColor(.green)
                }
                .frame(width: 120, height: 40)
                .background(.green)
                .cornerRadius(8)
                .padding()
                
                Spacer()
                
                Section {
                    CardView(name: cardText)
                }
                .alert("Black Jack", isPresented: $isBlackJack) {
                    Button("New game") {
                        restartGame()
                    }
                }
                .alert("Your score is \(playerCount)", isPresented: $playerStands) {
                    Button("Let the houe play") {
                        housePlays()
                    }
                }
                .alert("Sorry, you lost", isPresented: $isOver21) {
                    Button("New game") {
                        restartGame()
                    }
                }
                
                Spacer()
                
                Section {
                    VStack {
                        HStack {
                            ForEach(playerCards, id: \.self) {card in
                                CardView(name: card)
                            }
                        }
                        
                        HStack {
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
                            
                            Button {
                                stand()
                            } label: {
                                Text("Stand")
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 120, height: 40)
                            .background(.blue)
                            .cornerRadius(8)
                            .padding()
                        }
                        
                        Text("Your count is \(playerCount)")
                    }
                }
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .background(.green)
        .ignoresSafeArea()
        
    }
    
    func count() {
        switch cardText {
        case "A♠️", "A♣️", "A♥️", "A♦️":
            if playerCount >= 11 {
                playerCount += 1
            } else {
                playerCount += 11
            }
        case "2♠️", "2♣️", "2♥️", "2♦️":
            playerCount += 2
        case "3♠️", "3♣️", "3♥️", "3♦️":
            playerCount += 3
        case "4♠️", "4♣️", "4♥️", "4♦️":
            playerCount += 4
        case "5♠️", "5♣️", "5♥️", "5♦️":
            playerCount += 5
        case "6♠️", "6♣️", "6♥️", "6♦️":
            playerCount += 6
        case "7♠️", "7♣️", "7♥️", "7♦️":
            playerCount += 7
        case "8♠️", "8♣️", "8♥️", "8♦️":
            playerCount += 8
        case "9♠️", "9♣️", "9♥️", "9♦️":
            playerCount += 9
        case "J♠️", "J♣️", "J♥️", "J♦️":
            playerCount += 10
        case "Q♠️", "Q♣️", "Q♥️", "Q♦️":
            playerCount += 10
        case "K♠️", "K♣️", "K♥️", "K♦️":
            playerCount += 10
        default:
            print("nothing")
        }
        
    }
    
    func stand() {
        playerStands = true
    }
    
    func blackJack() {
        isBlackJack = true
    }
    
    func deal() {
        if playerCount > 21 {
            isOver21 = true
        } else if playerCount == 21{
            blackJack()
        } else {
            if isFirstCard {
                cardText = "\(fullDeck[turn])"
                playerCards.append(fullDeck[turn])
                turn += 1
                isFirstCard = false
            } else {
                turn += 1
                cardText = "\(fullDeck[turn])"
                playerCards.append(fullDeck[turn])
            }
        }
        count()
        print(playerCount)
    }
    
    func shuffle() {
        showShuffle = false
        round += 1
        fullDeck = [String]()
        for cardValue in cardValues {
            for suit in suits {
                fullDeck.append(cardValue + suit)
            }
        }
        fullDeck.shuffle()
    }
    
    func restartGame() {
        shuffle()
        playerCards = [String]()
        isOver21 = false
        playerStands = false
        isBlackJack = false
        playerCount = 0
        cardText = ""
    }
    
    func housePlays() {
        
    }
    
}

#Preview {
    BlackJack()
}
