//
//  ContentView.swift
//  TicTacToe SwiftUI
//
//  Created by Giorgio Giannotta on 21/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var squares = Array(repeating: "", count: 9)
    @State private var isPlayer1 = true
    @State private var winner = ""
    @State private var isGameOver = false
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe SwiftUI")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("Player \(isPlayer1 ? "1" : "2")'s Turn")
                .font(.headline)
                .foregroundColor(self.isPlayer1 ? Color.blue : Color.red)
                .padding(.vertical)
                .font(.title2)
            Spacer()
            VStack {
                ForEach(0 ..< 3) { row in
                    HStack {
                        ForEach(0 ..< 3) { column in
                            Button(action: {
                                if !self.isGameOver {
                                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                                        self.play(row, column)
                                    }
                                }
                            }) {
                                Text(self.squares[(row * 3) + column])
                                    .frame(width: 100, height: 100)
                                    .font(.largeTitle)
                                    .foregroundColor(self.isPlayer1 ? Color.blue : Color.red)
                                    .scaleEffect(self.isPlayer1 ? 1 : 1)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(self.isPlayer1 ? Color.blue.opacity(0.2) : Color.red.opacity(0.2), lineWidth: 2)
                            )
                        }
                    }
                }
            }
//            .background(self.isPlayer1 ? Color.blue.opacity(0.2) : Color.red.opacity(0.2))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(self.isPlayer1 ? Color.blue.opacity(0.2) : Color.red.opacity(0.2), lineWidth: 2)
            )
            if !winner.isEmpty {
                Text("Winner: \(winner)")
                    .font(.title)
                    .padding(.bottom)
                Button(action: {
                    self.restartGame()
                    }) {
                    Text("Restart Game")
                        .fontWeight(.medium)
                        .foregroundColor(.blue)
                        .font(.title3)
                }
            }
            Spacer()
            
            Spacer()
        }
    }
    
    func restartGame() {
            self.squares = Array(repeating: "", count: 9)
            self.isPlayer1 = true
            self.winner = ""
            self.isGameOver = false
        }
    
    func play(_ row: Int, _ column: Int) {
        let index = (row * 3) + column
        if squares[index].isEmpty {
            squares[index] = isPlayer1 ? "X" : "O"
            checkWinningConditions()
            isPlayer1.toggle()
        }
    }
    
    func checkWinningConditions() {
        let winningCombinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]
            ]
        for combination in winningCombinations {
                let first = combination[0]
                let second = combination[1]
                let third = combination[2]
                
                if squares[first] == squares[second] && squares[second] == squares[third] && !squares[first].isEmpty {
                    winner = squares[first]
                    isGameOver = true
                    break
                }
            }
            
            if !squares.contains("") && winner.isEmpty {
                winner = "It's a tie"
                isGameOver = true
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
