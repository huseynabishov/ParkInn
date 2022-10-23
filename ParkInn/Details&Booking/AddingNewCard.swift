//
//  AddingNewCard.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 28.07.2022.
//

import SwiftUI
import NavigationStack

struct AddingNewCard: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    @State var textFieldText: String = ""
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    
    @State private var name: String = ""
    @State private var number: String = ""
    @State private var expires: String = ""
    @State private var cvv: String = ""
    
    
    
    var body: some View {
        VStack(spacing: 0, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.pop()
                })
                Text("New Card")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .padding()
                Spacer()
            }
            .padding([.leading,.trailing])
            
            CreditCard {
                
                VStack{
                    Group {
                        if flipped {
                            CreditCardBack(cvv: cvv)
                        } else {
                            CreditCardFront(name: name, number: number, expires: expires)
                        }
                    }
                }.rotation3DEffect(.degrees(degrees),
                                   axis: (x: 0.0, y: 1.0, z: 0.0)
                )
                
            }.onTapGesture {
                withAnimation{
                    degrees += 180
                    flipped.toggle()
                }
            }
            
            TextField("Name", text: $name)
                .padding()
                .background(Color.gray.opacity(0.06).cornerRadius(10))
                .padding()
            
            TextField("Number", text: $number)
                .padding()
                .background(Color.gray.opacity(0.06).cornerRadius(10))
                .padding([.trailing,.leading])
            
            HStack(spacing: 0) {
            TextField("Expiration", text: $expires)
                .padding()
                .background(Color.gray.opacity(0.06).cornerRadius(10))
                .padding([.leading,.trailing,.top])
            
            TextField("CVV", text: $cvv)
            { (editingChanged) in
                withAnimation{
                    degrees += 180
                    flipped.toggle()
                }
            } onCommit: {}
                .keyboardType(.numberPad)
                .padding()
                .background(Color.gray.opacity(0.06).cornerRadius(10))
                .padding([.leading,.trailing,.top])
            }
            Spacer()
            
            
            
            
            HStack(spacing: 15){
                CustomButton(title: "Add New Card", action: {
                    
                    self.navigationStack.push(PaymentView(cardNumber: number))
                })
            }
            .frame(maxWidth: .infinity, maxHeight: 130, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color("ButtonColor"), lineWidth:2))
        })
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct AddingNewCard_Previews: PreviewProvider {
    static var previews: some View {
        AddingNewCard()
    }
}
