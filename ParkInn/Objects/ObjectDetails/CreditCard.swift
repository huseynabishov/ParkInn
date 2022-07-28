//
//  CreditCard.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 28.07.2022.
//

import SwiftUI

struct CreditCard<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

struct CreditCardFront: View {
    var body: some View {
        VStack {
            Text("FRONT").foregroundColor(Color.white)
        }.frame(width: 300, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue] ), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
    }
}

struct CreditCardBack: View {
    var body: some View {
        VStack {
            Text("").foregroundColor(Color.white)
        }.frame(width: 300, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.blue] ), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(10)
    }
}

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard<CreditCardFront>(content:  { CreditCardFront() })
    }
}
