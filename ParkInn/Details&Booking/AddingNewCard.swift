//
//  AddingNewCard.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 28.07.2022.
//

import SwiftUI
import NavigationStack

struct AddingNewCard: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    @State var textFieldText: String = ""
    
    
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
            
            Image("Debit")
                .resizable()
                .frame(width: .infinity, height: 250)
                .padding()
            
            Spacer()
            
            HStack() {
            HStack {
                TextField("NAME", text: self.$textFieldText)
            }
            .padding()
            .background(Color.gray.opacity(0.06).cornerRadius(10))
            }
            .padding(.leading)
            .padding(.trailing)
            
            Spacer()
            
            
            
            
            HStack(spacing: 15){
                CustomButton(title: "Add New Card", action: {
                    self.navigationStack.push(AddingNewCard())
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