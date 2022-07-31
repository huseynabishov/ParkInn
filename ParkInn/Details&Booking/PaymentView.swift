//
//  PaymentView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 26.07.2022.
//

import SwiftUI
import NavigationStack

enum methods {
    case Paypal
    case GoogleP
    case AppleP
    case VisaP
}

struct PaymentView: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    @State private var SelectedMethod: methods = .Paypal
    
    @State var cardNumber: String = ""
    
    var body: some View {
        VStack(spacing: 0, content: {
            HStack(){
                Arrow(title: "arrow.left", action: {
                    self.navigationStack.pop()
                })
                Text("Payment")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                    .padding()
                Spacer()
                Image(systemName: "qrcode.viewfinder")
                    .font(.system(size: 25))
            }
            .padding([.leading,.trailing])
            
            VStack(spacing: 20){
                HStack{
                    Text("Choose Payment Methods")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .padding()
                    Spacer()
                }
                
                
                Group{
                    PaymentButton(SelectedMethod: $SelectedMethod, CurrentMethod: .Paypal, image: "PayPal", title: "Paypal") {
                        SelectedMethod = .Paypal
                    }
                    PaymentButton(SelectedMethod: $SelectedMethod, CurrentMethod: .GoogleP, image: "Google", title: "Google Pay") {
                        SelectedMethod = .GoogleP
                    }
                    PaymentButton(SelectedMethod: $SelectedMethod, CurrentMethod: .AppleP, image: "Apple", title: "Apple Pay") {
                        SelectedMethod = .AppleP
                    }
                    if(cardNumber != "") {
                        PaymentButton(SelectedMethod: $SelectedMethod, CurrentMethod: .VisaP, image: "Visa", title: "**** **** **** " + cardNumber) {
                            SelectedMethod = .VisaP
                        }
                    }
                }
                ZStack{
                    AddPaymentButton(title: "Add New Card", action: {
                        self.navigationStack.push(AddingNewCard())
                    })
                }
                .padding()
            }
            
            
            Spacer()
            
            HStack(spacing: 15){
                CustomButton(title: "Continue", action: {
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

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
