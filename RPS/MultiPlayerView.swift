//
//  MultiPlayer.swift
//  RPS
//
//  Created by Aisaule Sibatova on 30.01.2022.
//
import SwiftUI

struct MultiPlayer: View {
    @Binding var player1: Player
    @Binding var player2: Player
    @Binding var round: Int
    @Binding var isMultiPlayer: Bool
    @State var isHidden = false
    
    @State var signArr: [Sign] = Sign.allCases
    var body: some View {
        NavigationView {
            VStack {
                Text("Pass the phone to you opponent")
                    .font(Font.system(size: 54, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Spacer()
                NavigationLink(destination: SecondPlayerPick(player1: $player1, player2: $player2, round: $round, isMultiPlayer: $isMultiPlayer)) {
                    CustomButton(title: "Ready to continue", isHidden: false)
                }
            }
        }.navigationBarHidden(true)
    }
}

struct MultiPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MultiPlayer(player1: .constant(Player()), player2: .constant(Player()), round: .constant(1), isMultiPlayer: .constant(false), isHidden: false)
    }
}
