//
//  SecondPlayerPick.swift
//  RPS
//
//  Created by Aisaule Sibatova on 30.01.2022.
//

import SwiftUI

struct SecondPlayerPick: View {
    @Binding var player1: Player
    @Binding var player2: Player
    @Binding var round: Int
    @Binding var isMultiPlayer: Bool
    @State var isHidden = false
    @State var isTapped: Bool = false
    @State var signArr: [Sign] = Sign.allCases
    var scoreColor = Color (red: 0.4, green: 0.31, blue: 0.64, opacity: 1.0)
    
    var body: some View {
        VStack {
            Text("Your pick")
                .font(Font.system(size: 54, weight: .bold))
                .multilineTextAlignment(.center)
            
            Text("score \(player1.score): \(player2.score)")
                .foregroundColor(scoreColor)
            
            Button {
                isTapped.toggle()
                player2.pick = .paper
            } label: {
                SignButton(sign: signArr[0].rawValue, isHidden: false)
            }
            NavigationLink("", destination: ResultView(player1: $player1, player2: $player2, round: $round, isMultiPlayer: $isMultiPlayer), isActive: $isTapped)
            
            Button {
                isTapped.toggle()
                player2.pick = .rock
            } label: {
                SignButton(sign: signArr[1].rawValue, isHidden: false)
            }
            NavigationLink("", destination: ResultView(player1: $player1, player2: $player2, round: $round, isMultiPlayer: $isMultiPlayer), isActive: $isTapped)
            
            Button {
                isTapped.toggle()
                player2.pick = .scissors
            } label: {
                SignButton(sign: signArr[2].rawValue, isHidden: false)
            }
            NavigationLink("", destination: ResultView(player1: $player1, player2: $player2, round: $round, isMultiPlayer: $isMultiPlayer), isActive: $isTapped)
                .navigationBarHidden(true)
            }

        }
    }

struct SecondPlayerPick_Previews: PreviewProvider {
    static var previews: some View {
        SecondPlayerPick(player1: .constant(Player()), player2: .constant(Player()), round: .constant(1), isMultiPlayer: .constant(false), isHidden: false)
    }
}
