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

//class TFManager:ObservableObject {
//
//    let characterLimit = 4
//     @Published var userInput = ""
//
//    func didSet() {
//        if userInput.count > characterLimit {
//            userInput = String(userInput.prefix(characterLimit))
//        }
//    }
//}

struct CreditCardFront: View {
    
    let name: String
    let number: String
    let expires: String
    
    @State var cardNumber: String?
//    @ObservedObject var tfManager = TFManager()

    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Text("VISA")
                    .foregroundColor(Color.white)
                    .font(.system(size: 27))
                    .fontWeight(.bold)
                
            }
            
            Spacer()
            
            VStack(spacing: 5) {
            
                Text(number)
//                TextField("", text: $tfManager.userInput)
                    .foregroundColor(Color.white)
                    .font(.system(size: 27))

            }
            
            Spacer()
            
            HStack {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("CARD HOLDER")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    
                    Text(name)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                
                Spacer()
                
                VStack(spacing: 5) {
                    Text("EXPIRES")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    Text(expires)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
            }
            
            
            
        }.frame(width: 340, height: 220)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("AccentColorP"), Color("AccentColor")] ), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(15)
    }
}

struct CreditCardBack: View {
    
    let cvv: String

    var body: some View {
        VStack {
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 40)
                .padding([.top])
                .foregroundColor(Color.gray.opacity(0.8))
            
            Spacer()
            
            HStack {
                
                Text(cvv)
                    .keyboardType(.numberPad)
                    .foregroundColor(Color.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding(5)
                    .frame(width: 100, height: 30)
                    .background(Color.white)
                
                
                Spacer()
                
            }.padding()
            
        }.frame(width: 340, height: 220)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("AccentColorP"), Color("AccentColor")] ), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(15)
    }
}


                    
                    
                    
                    
struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard<CreditCardFront>(content:  { CreditCardFront(name: "", number: "", expires: "") })
        
        CreditCard<CreditCardBack>(content:  { CreditCardBack(cvv: "") })
    }
}
