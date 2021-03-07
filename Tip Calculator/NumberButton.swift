//
//  NumberButton.swift
//  Tip Calculator
//
//  Created by Michał Lubowicz on 31/07/2020.
//  Copyright © 2020 Michał Lubowicz. All rights reserved.
//

import SwiftUI

struct NumberButton: View {
    var number: Int
    let screenSize: CGRect = UIScreen.main.bounds
    var body: some View {
        ZStack{
            Circle()
                .frame(width: (screenSize.width-100)/3, height: (screenSize.width-100)/3)
                .foregroundColor(.black)
            Text("\(number)")
                .font(.system(size: 50))
                .fontWeight(.regular)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
    }
}


struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(number: 1)
    }
}

