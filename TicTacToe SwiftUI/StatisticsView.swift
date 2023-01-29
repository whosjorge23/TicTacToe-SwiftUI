//
//  StatisticsView.swift
//  TicTacToe SwiftUI
//
//  Created by Giorgio Giannotta on 22/01/23.
//

import SwiftUI

struct StatisticsView: View {
    @Binding var stats: Statistics
        var body: some View {
            VStack {
                Spacer()
                Text("Statistics")
                .font(.largeTitle)
                .fontWeight(.semibold)
                Text("Games Played: \(stats.gamesPlayed)")
                    .font(.headline)
                Text("Player 1 Won: \(stats.gamesWon1)")
                    .font(.headline)
                Text("Player 2 Won: \(stats.gamesWon2)")
                    .font(.headline)
                Text("Games Tied: \(stats.gamesTied)")
                    .font(.headline)
                Spacer()
            }
        }
}

//struct StatisticsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatisticsView(stats: Statistics(gamesPlayed: 5, gamesWon1: 3, gamesWon2: 1, gamesTied: 1))
//    }
//}
