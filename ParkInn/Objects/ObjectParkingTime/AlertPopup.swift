//
//  AlertPopup.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 26.11.2022.
//

import SwiftUI

struct AlertPopup: View {
    var body: some View {
        ZStack() {
            Circle()
                .frame(width: 130, height: 130)
                .foregroundColor(Color("AccentColor"))
                .padding()
                .overlay(
                    ZStack{
                        Image(systemName: "drop.fill")
                            .foregroundColor(Color.white)
                            .rotationEffect(.degrees(180))
                            .font(.system(size: 50))
                            
                        Circle()
                            .frame(width: 14, height: 14)
                            .foregroundColor(Color("AccentColor"))
                            .padding(.bottom, 12)
                    }
                )
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("AccentColor"))
                .opacity(0.7)
                .foregroundColor(Color.black)
                .frame(width: 160, height: 170, alignment: .topLeading)
            Circle()
                .frame(width: 7, height: 7)
                .foregroundColor(Color("AccentColor"))
                .opacity(0.7)
                .foregroundColor(Color.black)
                .frame(width: 165, height: 165, alignment: .top)
                .padding(.leading)
            Circle()
                .frame(width: 15, height: 15)
                .foregroundColor(Color("AccentColor"))
                .opacity(0.7)
                .foregroundColor(Color.black)
                .frame(width: 165, height: 160, alignment: .topTrailing)
                .padding(.top, 30)
            Circle()
                .frame(width: 6, height: 6)
                .foregroundColor(Color("AccentColor"))
                .opacity(0.7)
                .foregroundColor(Color.black)
                .frame(width: 130, height: 30, alignment: .bottomTrailing)
                .padding(.leading)
                .padding(.top)
            Circle()
                .frame(width: 6, height: 6)
                .foregroundColor(Color("AccentColor"))
                .opacity(0.7)
                .foregroundColor(Color.black)
                .frame(width: 155, height: 140, alignment: .bottomTrailing)
                .padding(.trailing)
            Circle()
                .frame(width: 3, height: 3)
                .foregroundColor(Color("AccentColor"))
                .opacity(0.7)
                .foregroundColor(Color.black)
                .frame(width: 35, height: 140, alignment: .bottomTrailing)
                .padding(.leading)
                .padding(.top)
            Circle()
                .frame(width: 9, height: 9)
                .foregroundColor(Color("AccentColor"))
                .opacity(0.7)
                .foregroundColor(Color.black)
                .frame(width: 50, height: 170, alignment: .bottomLeading)
                .padding(.trailing)
            Circle()
                .frame(width: 11, height: 11)
                .foregroundColor(Color("AccentColor"))
                .opacity(0.7)
                .foregroundColor(Color.black)
                .frame(width: 160, height: 90, alignment: .bottomLeading)
                .padding(.trailing)
            Circle()
                .frame(width: 3, height: 3)
                .foregroundColor(Color("AccentColor"))
                .opacity(0.7)
                .foregroundColor(Color.black)
                .frame(width: 210, height: 30, alignment: .topLeading)
                .padding(.leading)
        }    }
}

struct AlertPopup_Previews: PreviewProvider {
    static var previews: some View {
        AlertPopup()
    }
}
