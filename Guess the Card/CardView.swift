//
//  CardView.swift
//  Guess the Card
//
//  Created by Carlos Román Alcaide on 30/3/24.
//

import SwiftUI

struct CardView: View {
    
    @State var showCard = true
    
    var name: String
    
    var body: some View {
        
        Text(name)
            .font(.system(size: 29))
            .frame(width: 60, height: 90)
            .border(showCard ? Color.red : Color.green)
            .background(showCard ? .white : .green)
            .cornerRadius(3.0)
    }
}

#Preview {
    CardView(name: "4")
}
