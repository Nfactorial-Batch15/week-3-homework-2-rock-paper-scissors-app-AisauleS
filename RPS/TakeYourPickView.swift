//
//  SwiftUIView.swift
//  RPS
//
//  Created by Aisaule Sibatova on 30.01.2022.
//

import SwiftUI

struct SinglePlayer: View {
    @Binding var player1: Player
    @Binding var player2: Player
    @Binding var round: Int
    @Binding var isMultiPlayer: Bool
    @State var isHidden = true
    @State var signArr: [Sign] = Sign.allCases
    var scoreColor = Color (red: 0.4, green: 0.31, blue: 0.64, opacity: 1.0)
    
    var body: some View {
        NavigationView {
        VStack {
            Text(isHidden ? "Take your pick" : "Your pick")
                .font(Font.system(size: 54, weight: .bold))
                .multilineTextAlignment(.center)

            Text("score \(player1.score) : \(player2.score)")
                .foregroundColor(scoreColor)

            Spacer()
            ForEach(signArr, id: \.self){sign in
            
                Button {
                    player1.pick = sign
                    player2.pick = signArr[Int.random(in: 0...2)]
                    print(player1.pick, player2.pick)
                    signArr.removeAll()
                    isHidden.toggle()
                } label: {
                    SignButton(sign: sign.rawValue, isHidden: false)
                }
            }
            
            if !isMultiPlayer {
                NavigationLink(destination: RandomPlayer(
                    player1: $player1,
                    player2: $player2,
                    round: $round, isMultiPlayer: $isMultiPlayer))
                {
                    Text(player1.pick.rawValue)
                        .font(.system(size: 54))
                        .frame(width: 324, height: isHidden ? 0 : 128)
                        .background(Color.customGray)
                        .cornerRadius(16)
                        .opacity(isHidden ? 0 : 1)
                }
            } else {
                NavigationLink(destination: MultiPlayer(
                    player1: $player1,
                    player2: $player2,
                    round: $round, isMultiPlayer: $isMultiPlayer))
                {
                    Text(player1.pick.rawValue)
                        .font(.system(size: 54))
                        .frame(width: 324, height: isHidden ? 0 : 128)
                        .background(Color.customGray)
                        .cornerRadius(16)
                        .opacity(isHidden ? 0 : 1)
                }
                
            }
            
            Spacer()
            Button {
                signArr = Sign.allCases
                isHidden.toggle()
            } label: {
                CustomButton(title: "I change my mind", isHidden: isHidden)
            }
            
        }
        }.navigationBarHidden(true)
    }
}

struct SinglePlayer_Previews: PreviewProvider {
    static var previews: some View {
        SinglePlayer(player1: .constant(Player()), player2: .constant(Player()), round: .constant(1), isMultiPlayer: .constant(false))
    }
}

