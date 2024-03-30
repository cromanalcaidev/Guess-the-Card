//
//  CardView.swift
//  Guess the Card
//
//  Created by Carlos Román Alcaide on 30/3/24.
//

import SwiftUI

struct CardView: View {
    
    var name: String
    
    var body: some View {
        Text(name)
            .frame(width: 60, height: 90)
            .border(Color.red)
            .background(.green)
            .cornerRadius(3.0)
    }
}

#Preview {
    CardView(name: "4")
}
