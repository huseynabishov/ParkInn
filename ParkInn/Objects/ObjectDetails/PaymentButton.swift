//
//  PaymentButton.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 26.07.2022.
//

import SwiftUI

struct PaymentButton: View {
    
    @Binding var SelectedMethod: methods
    @State var CurrentMethod: methods
    
    let image: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(){
                Image(image)
                    .padding()
                VStack(alignment: .leading,spacing: 10){
                    Text(String(SelectedMethod == CurrentMethod  ? (title) : title))
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                }
                Spacer()
                
                if SelectedMethod != CurrentMethod {
                    Image(systemName: "circle")
                        .font(.system(size: 20))
                        .foregroundColor(Color("AccentColor"))
                } else {
                    Image(systemName: "circle.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(Color("AccentColor"))
                }
                
            }
            .padding()
        }
        .frame(maxWidth: 360, maxHeight: 80, alignment: .center)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.white, lineWidth:4))
        .background(Color.white.cornerRadius(20))
        
        .shadow(
            color: Color.gray.opacity(0.20),
            radius: 10, x: 0, y: 0)
    }
}

struct PaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
