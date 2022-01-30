//
//  GameLogic.swift
//  RPS
//
//  Created by Aisaule Sibatova on 30.01.2022.
//

import SwiftUI

class Player{
    var score  = 0
    var pick: Sign = .paper
}

enum Sign: String, CaseIterable {
    case paper = "📃"
    case rock = "🗿"
    case scissors = "✂️"
}


func gameResult(_ player1: Sign, _ player2: Sign)-> String{
    switch (player1,  player2) {
    case (.rock, .rock):     return "Tie"
    case (.rock, .paper):    return "Lose"
    case (.rock, .scissors): return "Win"
        
    case (.paper, .rock):     return "Win"
    case (.paper, .paper):    return "Tie"
    case (.paper, .scissors): return "Lose"
        
    case (.scissors, .rock):     return "Lose"
    case (.scissors, .paper):    return "Win"
    case (.scissors, .scissors): return "Tie"
    }

}

func getScore(_ player1: Player, _ player2: Player, _ gameResult: String) {
    switch gameResult {
    case "Win": player1.score += 1
    case "Lose": player2.score += 1
    default:
        print("Tie")
    }
}

