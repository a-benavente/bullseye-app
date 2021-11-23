//
//  ContentView.swift
//  Bullseye
//
//  Created by amanduh on 9/21/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    
  
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsViews(game: $game)
                    .padding(.bottom, alertVisible ? 0 : 100)
                if alertVisible{
                    PointsView(alertVisible: $alertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertVisible: $alertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
        
                }
                if !alertVisible{
                    SliderView(sliderValue: $sliderValue)
                        .transition(.scale)
                }
                
            }
        }
    }
}


struct InstructionsViews: View{
    @Binding var game: Game
    var body: some View {
        VStack{InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN!")
            .padding(.leading, 30.0)
            .padding(.trailing, 30.0)
        BigNumberText(text: String(game.target))}
    }
}


struct SliderView: View {
    @Binding var sliderValue: Double
    var body: some View {
        HStack{
            SliderLabelText(num: "1")
            Slider(value: $sliderValue, in: 1...100)
            SliderLabelText(num: "100")
        }
        .padding()
    }
}

struct HitMeButton: View{
    @Binding var alertVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation{
            alertVisible = true
            }
            
        }){
            Text("Hit me!".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
//        .alert(isPresented: $alertVisible, content: {
//            let roundedValue = Int(sliderValue.rounded())
//            let points = game.points(sliderValue: roundedValue)
//            return Alert(title: Text("Hello There"), message: Text("The Slider's value is \(roundedValue).\n" + "You scored \(points) points this round"), dismissButton: .default(Text("Awesome")){
//                game.startNewRound(points: points)
//            }
//
//            )
//        })
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
