//
//  BackgroundView.swift
//  Bullseye
//
//  Created by amanduh on 9/30/21.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
        RingsView()
        )
    }
}
struct TopView: View {
    @State private var leaderboardIsShowing = false
    @Binding var game: Game
    var body: some View {
        HStack{
            Button(action: {game.restart()}){
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
                Button {
                    leaderboardIsShowing = true
                } label: {
                    RoundedImageViewFilled(systemName: "list.dash")
                }.sheet(isPresented: $leaderboardIsShowing) {
                    
                } content: {
                    LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
                }


            }
        }
    }
}

struct NumberView: View {
    @Binding var game: Game
    var title: String
    var text: String
    var body: some View {
        
        VStack(spacing: 5) {
            LabelText(text: title)
            RoundRectTextView(text: text)
        }
        
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack{
            NumberView(game: $game, title: "Score", text: String(game.score))
            Spacer()
            NumberView(game: $game, title: "Round", text: String(game.round))
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6){ ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("CircleColor").opacity(opacity), Color("CircleColor").opacity(0.0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300))
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
