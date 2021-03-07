//
//  SwiftUIView.swift
//  Tip Calculator
//
//  Created by Michał Lubowicz on 30/07/2020.
//  Copyright © 2020 Michał Lubowicz. All rights reserved.
//

import SwiftUI

struct CustomSlider: View {
    
    @Binding var percentage: Float
    @Binding var set: Int
    @Binding var colors: [Color]
    var body: some View {
        ZStack(alignment: .leading) {
            Image("FaceScaleBlackWhite")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 66 / 375)
            Image("FaceScale")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * CGFloat(self.percentage / 100), height: UIScreen.main.bounds.width * 66 / 375, alignment: .leading)
                .clipped()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 66 / 375)
        .gesture(DragGesture(minimumDistance: 0)
            .onChanged({ value in
                let arr: [Int] = [0, 32, 71, 110, 149, 188, 226, 265, 304, 343, 385]
                var new: [Int] = []
                for x in arr {
                    new.append((x * Int(UIScreen.main.bounds.width)) / 375)
                }
                self.percentage = min(max(0, Float(self.nearest(arr: new, value: Int(value.location.x)))*100/Float(UIScreen.main.bounds.width)), 100)
                self.set = new.firstIndex(of: self.nearest(arr: new, value: Int(value.location.x)))!
                self.colors = [Color("Red"), Color("Orange"), Color("Orange2"), Color("Yellow"), Color("Green")]
            }))
    }
    func nearest(arr: [Int], value: Int)->Int{
        var best = 0
        var smallest = arr.max()!
        for x in arr {
            if(abs(value-x) < smallest){
                best = x
                smallest = abs(value-x)
            }
        }
        return best
    }
}
