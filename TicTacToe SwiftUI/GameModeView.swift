//
//  GameModeView.swift
//  TicTacToe SwiftUI
//
//  Created by Giorgio Giannotta on 24/01/23.
//

import SwiftUI

struct GameModeView: View {
    @State private var selectedMode = 0
    let modes = ["Play against AI", "Play against another player"]

        var body: some View {
            NavigationView {
                VStack(alignment: HorizontalAlignment.center,spacing: 50) {
                    Text("Choose Game Mode").fontWeight(.bold).font(.largeTitle)
                    NavigationLink(destination: GameAIView()) {
                        VStack {
                            AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/2021/2021646.png")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.blue.opacity(0.1)
                            }
                            .frame(width: 200, height: 200)
                            .cornerRadius(20)
                            Text("Play against AI").font(.title)
                        }
                    }
                    NavigationLink(destination: GamePlayerView()) {
                        VStack {
                            AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/4140/4140037.png")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.blue.opacity(0.1)
                            }
                            .frame(width: 200, height: 200)
                            .cornerRadius(20)
                            Text("Play against another player").font(.title)
                        }
                    }
                }
            }
    }
}


struct GameModeView_Previews: PreviewProvider {
    static var previews: some View {
        GameModeView()
    }
}
