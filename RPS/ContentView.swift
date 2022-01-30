//
//  ContentView.swift
//  RPS
//
//  Created by Aisaule Sibatova on 30.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State var round  = 0
    @State var player1 = Player()
    @State var player2 = Player()
    @State var isMultiPlayer = false

    var body: some View {
        NavigationView{
            ZStack{
                Image("BackgroundImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text ("Welcome to the game!")
                        .bold()
                        .font(.system(size: 54))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top,40)
                    Spacer()
                    
                    NavigationLink(destination: SinglePlayer(player1: $player1, player2: $player2, round: $round, isMultiPlayer: $isMultiPlayer)) {
                        CustomButton(title: "Single Player", isHidden: false)
                    }
                    NavigationLink(destination: SinglePlayer(player1: $player1, player2: $player2, round: $round, isMultiPlayer: $isMultiPlayer), isActive: $isMultiPlayer) {
                            CustomButton(title: "Multi Player", isHidden: false)
                    }

                }
                .padding(.horizontal, 16)
                }
        }.navigationBarHidden(true)
        }
    }

struct CustomButton: View {
    var title: String
    var isHidden: Bool
    var buttonColor = Color (red: 0.4, green: 0.31, blue: 0.64, opacity: 1.0)
    
    var body: some View {
        Text(title)
            .foregroundColor(.white)
                .frame(width: 358, height: 50)
                .background(buttonColor)
                .cornerRadius(8)
                .opacity(isHidden ? 0 : 1)
    }
}

struct SignButton: View {
    var sign: String
    var isHidden: Bool
    var body: some View {
        Text(sign)
            .font(.system(size: 54))
            .frame(width: 324, height: 128)
            .background(Color.customGray)
            .cornerRadius(16)
            .opacity(isHidden ? 0 : 1)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    public static var customGray: Color {
        return Color(UIColor(red: 243/255, green: 242/255, blue: 248/255, alpha: 1.0))
    }
}
