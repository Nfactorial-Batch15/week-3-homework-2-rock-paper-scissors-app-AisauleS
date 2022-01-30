//
//  RandomPlayer.swift
//  RPS
//
//  Created by Aisaule Sibatova on 30.01.2022.
//

import SwiftUI

struct RandomPlayer: View {
    @State var isLoaded = false
    var img = "loading"
    @Binding var player1: Player
    @Binding var player2: Player
    @Binding var round: Int
    @Binding var isMultiPlayer: Bool
    var body: some View {
        VStack{
            Text(isLoaded ? "Your opponent's pick" : "Your opponent is thinking")
                .font(Font.system(size: 54, weight: .bold))
                .multilineTextAlignment(.center)
                .padding(.top, 62)
            Spacer()
            NavigationLink(destination: ResultView(player1: $player1, player2: $player2, round: $round, isMultiPlayer: $isMultiPlayer )) {
                if let player2 = player2.pick {
                    if !isLoaded {
                        ProgressView()
                            .scaleEffect(2)
                            .onAppear(perform: delayText)
                    } else {
                        Text("\(player2.rawValue)")
                            .font(.system(size: 54))
                            .frame(width: 324, height: 128)
                            .background(Color.customGray)
                            .cornerRadius(16)
                    }
                }
            }.navigationBarHidden(true)
            Spacer()
        }
        
    }
    
    private func delayText() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                isLoaded = true
            }
        }
}


    
struct RandomPlayer_Previews: PreviewProvider {
    static var previews: some View {
        RandomPlayer(player1: .constant(Player()), player2: .constant(Player()), round: .constant(1), isMultiPlayer: .constant(false))
    }
}
