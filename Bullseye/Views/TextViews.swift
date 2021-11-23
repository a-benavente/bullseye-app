//
//  TextViews.swift
//  Bullseye
//
//  Created by amanda on 9/26/21.
//

import SwiftUI

struct InstructionText: View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}
struct BigNumberText:View {
    var text: String
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelText: View {
    var num: String
    var body: some View{
        Text(num)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View{
    var text: String
    var body: some View{
        Text(text.uppercased())
            .kerning(1.5)
            .bold()
            .font(.caption)
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View{
    var text: String
    var body: some View{
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center).lineSpacing(13)
            .frame(width: 167, height: 68, alignment: .center)
            
        
        
    }
}
struct ButtonText: View{
    var text: String
    var body: some View{
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(Color.white)
            .cornerRadius(15)
        
        
        
    }
}

struct ScoreText: View{
    var score: Int
    var body: some View{
        Text(String(score))
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .bold()
        
    }
}
struct DateText: View{
    var date: Date
    var body: some View{
        Text(date, style: .time)
            .kerning(-0.2)
            .font(.title3)
            .foregroundColor(Color("TextColor"))
            .bold()
            
    }
}

struct BigBoldText: View {
    var text: String
    var body: some View{
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
    }
}
struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            LabelText(text: "Hello")
            BodyText(text: "You scored 200 Points 🎉🎉🎉")
            ButtonText(text: "Start New Round")
            ScoreText(score: 100)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()
    }
}
