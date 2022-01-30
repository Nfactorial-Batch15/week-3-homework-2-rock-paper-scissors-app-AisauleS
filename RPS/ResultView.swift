//
//  ResultView.swift
//  RPS
//
//  Created by Aisaule Sibatova on 30.01.2022.
//

import SwiftUI

struct ResultView: View {
    @Binding var player1: Player
    @Binding var player2: Player
    @Binding var round: Int
    @Binding var isMultiPlayer: Bool
    
    @State var result = ""
    
    var scoreColor = Color (red: 0.4, green: 0.31, blue: 0.64, opacity: 1.0)
    
//    var tieColour = CGColor(LinearGradient(colors: [Color(red: 255, green: 204, blue: 0, opacity: 1.0) ,Color(red: 255, green:92, blue: 0, opacity: 1.0) ], startPoint: .top, endPoint: .bottom))
//
//
                                   
                                   
                                   
    var body: some View {
        VStack {
            
            if result == "Tie" {
            Text(result)
                .font(Font.system(size: 54, weight: .bold))
                .multilineTextAlignment(.center)
                .foregroundColor(.yellow)
            }
            if result == "Lose" {
                Text(result)
                    .font(Font.system(size: 54, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.red)
                }
            
            if result == "Win" {
                Text(result)
                    .font(Font.system(size: 54, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.green)
                }
            
            
            Text("score \(player1.score) : \(player2.score)")
                .foregroundColor(scoreColor)
            Spacer()
        ZStack {
            ZStack {
                Capsule()
                    .foregroundColor(.customGray)
                    .frame(width: 190, height: 128)
                    Text(player1.pick.rawValue)
                    .font(Font.system(size: 80))
            }
            .padding(.trailing, 152)
            
            ZStack {
                Capsule()
                    .foregroundColor(.white)
                    .frame(width: 210, height: 138)
                Capsule()
                    .foregroundColor(.customGray)
                    .frame(width: 190, height: 128)
                
                Text(player2.pick.rawValue)
                    .font(Font.system(size: 80))
            }
            .padding(.top, 80)
            .padding(.leading, 160)
        }.padding(.bottom, 100)
            Spacer()
            NavigationLink(destination: SinglePlayer(player1: $player1, player2: $player2, round: $round, isMultiPlayer: $isMultiPlayer)) {
                CustomButton(title: "Another round", isHidden: false)
            }.navigationBarHidden(true)
        
    }
        .onAppear {
            result = gameResult(player1.pick, player2.pick)
            getScore(player1, player2, result)
        }
        
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(player1: .constant(Player()), player2: .constant(Player()), round: .constant(1), isMultiPlayer: .constant(false))
    }
}
