//
//  PointsView.swift
//  Bullseye
//
//  Created by amanduh on 10/2/21.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10){
            InstructionText(text: "The slider value is")
            BigNumberText(text: "\(roundedValue)")
            BodyText(text: "You scored \(points) points 🥳🥳🥳")
            Button(action: {
                withAnimation{
                alertVisible = false
                }
                game.startNewRound(points: points)}){
                ButtonText(text: "Start New Round")
            }
        }
            .padding()
            .frame(maxWidth:300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundRectCornerRadius)
            .shadow(radius: 10, x: 5, y: 5)
            .transition(.scale)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        PointsView(alertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        PointsView(alertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(alertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        PointsView(alertVisible: alertIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
