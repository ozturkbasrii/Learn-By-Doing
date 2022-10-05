//
//  ContentView.swift
//  Learn By Doing
//
//  Created by Hasan Basri Öztürk on 5.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    var cards: [Card] = cardData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false)  {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { item in
                    CardView(card: item)
                }
            }
            .padding(20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: cardData )
    }
}
