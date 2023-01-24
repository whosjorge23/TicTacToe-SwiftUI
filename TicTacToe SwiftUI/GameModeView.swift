//
//  GameModeView.swift
//  TicTacToe SwiftUI
//
//  Created by Giorgio Giannotta on 24/01/23.
//

import SwiftUI

struct GameModeView: View {
    @State private var selectedMode = 0
    var body: some View {
        VStack {
            
            Picker(selection: $selectedMode, label: Text("")) {
                Text("vs AI").tag(0)
                Text("vs Player").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            Button(action: {
                if self.selectedMode == 0 {
                    // inizia gioco contro l'AI
                } else {
                    // inizia gioco contro un altro giocatore
                }
            }) {
                Text("Start Game")
                    .fontWeight(.medium)
                    .foregroundColor(.blue)
            }
        }
    }
}


struct GameModeView_Previews: PreviewProvider {
    static var previews: some View {
        GameModeView()
    }
}
