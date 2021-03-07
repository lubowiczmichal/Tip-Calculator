//
//  ContentView.swift
//  Tip Calculator
//
//  Created by Michał Lubowicz on 30/07/2020.
//  Copyright © 2020 Michał Lubowicz. All rights reserved.
//

import SwiftUI
/*HStack {
    Spacer()
    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
        
    }
}*/
struct ContentView: View {
    let screenSize: CGRect = UIScreen.main.bounds
    var dotPressed: Bool = false
    var minTip = 0
    var maxTip = 20
    @State var colors: [Color] = [Color.white]
    @State var cost: String = ""
    @State var percentage: Float = 0
    @State var set: Int = 0
    var body: some View {
        VStack{
            Spacer()
            CustomSlider(percentage: $percentage, set: $set, colors: $colors)
            Text("\(self.count())%")
            Spacer()
            Text("\(String(format:"%.2f", (cost as NSString).doubleValue))")
                .font(.headline)
            Text("\(String(format:"%.2f", Double(self.count())/100 * (cost as NSString).doubleValue +  (cost as NSString).doubleValue))")
            VStack {
                HStack{
                    Button(action: {
                        self.clicked(number: "1")
                    }) {
                        NumberButton(number: 1)
                    }
                    Button(action: {
                        self.clicked(number: "2")
                    }) {
                        NumberButton(number: 2)
                    }
                    Button(action: {
                        self.clicked(number: "3")
                    }) {
                        NumberButton(number: 3)
                    }
                }
                HStack{
                    Button(action: {
                        self.clicked(number: "4")
                    }) {
                        NumberButton(number: 4)
                    }
                    Button(action: {
                        self.clicked(number: "5")
                    }) {
                        NumberButton(number: 5)
                    }
                    Button(action: {
                        self.clicked(number: "6")
                    }) {
                        NumberButton(number: 6)
                    }
                }
               HStack{
                    Button(action: {
                        self.clicked(number: "7")
                    }) {
                        NumberButton(number: 7)
                    }
                    Button(action: {
                        self.clicked(number: "8")
                    }) {
                        NumberButton(number: 8)
                    }
                    Button(action: {
                        self.clicked(number: "9")
                    }) {
                        NumberButton(number: 9)
                    }
                }
                HStack{
                    Button(action: {
                        self.clicked(number: ".")
                    }) {
                        ZStack{
                            Circle()
                                .frame(width: (screenSize.width-100)/3, height: (screenSize.width-100)/3)
                                .foregroundColor(.gray)
                            Text(".")
                                .font(.system(size: 50))
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                    Button(action: {
                        self.clicked(number: "0")
                    }) {
                        NumberButton(number: 0)
                    }
                    Button(action: {
                        self.cost = ""
                    }) {
                        ZStack{
                            Circle()
                                .frame(width: (screenSize.width-100)/3, height: (screenSize.width-100)/3)
                                .foregroundColor(.gray)
                            Text("C")
                                .font(.system(size: 50))
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [colors[(set-1)/2], Color.gray, Color.white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
    
    func clicked(number: String){
        cost += number
    }
    
    func count() -> Int {
        let total = ((Double(minTip)) + (Double(set) / 10 * Double(maxTip - minTip)))
        return Int(total)
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

