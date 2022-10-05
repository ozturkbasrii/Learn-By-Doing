//
//  CardView.swift
//  Learn By Doing
//
//  Created by Hasan Basri Öztürk on 5.10.2022.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    @State private var fadeIn: Bool = false
    @State private var moveDownward: Bool = false
    @State private var showAlert: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .opacity(fadeIn ? 1 : 0)
            
            VStack {
                Text(card.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Text(card.headline )
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .italic()
                
            }
            .offset(y: moveDownward ? -218 :  -300 )
            
            
                
                Button {
                    print("Button clicked")
                    playSound(sound: "sound-chime", type: "mp3")
                    hapticImpact.impactOccurred()
                    showAlert.toggle()
                } label: {
                    HStack {
                        Text(card.callToAction.uppercased())
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                        .accentColor(Color.white)
                        
                        Image(systemName: "arrow.right.circle")
                            .font(Font.title.weight(.medium))
                            .accentColor(Color.white)
                    }
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: card.gradientColors ), startPoint: .leading, endPoint: .trailing ))
                    .clipShape(Capsule())   
            }
                .offset(y: moveDownward ? 210 : 300)
            

            
            
        }
        .frame(width: 335, height: 545)
        .background(LinearGradient(gradient: Gradient(colors: card.gradientColors ), startPoint: .top, endPoint: .bottom ))
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear() {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            
            withAnimation(.linear(duration: 0.8)){
                moveDownward.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(card.title), message: Text(card.message), dismissButton:  .default(Text("OK")))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[1])
    }
}
