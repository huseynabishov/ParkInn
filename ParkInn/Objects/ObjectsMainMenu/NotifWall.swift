//
//  NotifCanc.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 21.06.2022.
//

import SwiftUI

struct NotifWall: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(){
                Spacer()
                ZStack() {
                    Circle()
                        .frame(width: 65, height: 65)
                        .foregroundColor(Color("AccentColor"))
                        .padding()
                        .overlay(
                            Image(systemName: "wallet.pass.fill")
                                .font(.system(size:23))
                                .foregroundColor(Color.white)
                        )
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.7)
                        .foregroundColor(Color.black)
                        .frame(width: 80, height: 80, alignment: .topLeading)
                    Circle()
                        .frame(width: 3, height: 3)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.7)
                        .foregroundColor(Color.black)
                        .frame(width: 100, height: 80, alignment: .top)
                        .padding(.leading)
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.7)
                        .foregroundColor(Color.black)
                        .frame(width: 90, height: 100, alignment: .topTrailing)
                        .padding(.top, 30)
                    Circle()
                        .frame(width: 3, height: 3)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.7)
                        .foregroundColor(Color.black)
                        .frame(width: 60, height: 10, alignment: .bottomTrailing)
                        .padding(.leading)
                        .padding(.top)
                    Circle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.7)
                        .foregroundColor(Color.black)
                        .frame(width: 85, height: 72, alignment: .bottomTrailing)
                        .padding(.trailing)
                    Circle()
                        .frame(width: 2, height: 2)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.7)
                        .foregroundColor(Color.black)
                        .frame(width: 10, height: 65, alignment: .bottomTrailing)
                        .padding(.leading)
                        .padding(.top)
                    Circle()
                        .frame(width: 6, height: 6)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.7)
                        .foregroundColor(Color.black)
                        .frame(width: 25, height: 90, alignment: .bottomLeading)
                        .padding(.trailing)
                    Circle()
                        .frame(width: 7, height: 7)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.7)
                        .foregroundColor(Color.black)
                        .frame(width: 75, height: 40, alignment: .bottomLeading)
                        .padding(.trailing)
                    Circle()
                        .frame(width: 2, height: 2)
                        .foregroundColor(Color("AccentColor"))
                        .opacity(0.7)
                        .foregroundColor(Color.black)
                        .frame(width: 95, height: 25, alignment: .topLeading)
                    
                }
                VStack(){
                    Text("E-Wallet Connected")
                        .foregroundColor(Color.black)
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .padding(.bottom,4)
                        .padding(.trailing,62)
//                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                    Text("Wallet has been connected to ParkInn")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .light, design: .rounded))
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                }
            }
            .frame(maxWidth: 360, maxHeight: 115, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth:1))
            .background(Color.white.cornerRadius(20))

            .shadow(
                color: Color.gray.opacity(0.20),
                radius: 10, x: 0, y: 0)
        }
    }
}

struct NotifWall_Previews: PreviewProvider {
    static var previews: some View {
        NotifWall(title: "", action: {})
    }
}
