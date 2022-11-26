//
//  TriptoLoc.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 26.11.2022.
//

import SwiftUI
import NavigationStack

struct TriptoLoc: View {
    
    @State var customAlert = false
    @State private var showingPopover = false
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    var body: some View {
        ZStack{
            VStack(spacing: 0, content: {
                HStack(spacing: 15){
                    CustomButton(title: "Confirm Payment", action: {
                        showingPopover = true
                    })
                }
                .frame(maxWidth: .infinity, maxHeight: 130, alignment: .center)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("ButtonColor"), lineWidth:2))
            })
            .ignoresSafeArea(.all, edges: .bottom)
            
            PopUpWindow0(action: {}, title: "", message: "", buttonText: "", show: $showingPopover)
        }
    }
}
struct PopUpWindow0: View {
    
    @EnvironmentObject private var navigationStack: NavigationStackCompat
    
    let action: () -> Void
    
    var title: String
    var message: String
    var buttonText: String
    @Binding var show: Bool
    var body: some View {
        ZStack {
            if show {
                Group{
                    Color.black.opacity(show ? 0.7 : 0).edgesIgnoringSafeArea(.all)
                    VStack(alignment: .center, spacing: 20) {
                        
                        AlertPopup()
                        
                        Text("You have arrived!")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                            .foregroundColor(Color("AccentColor"))
                        Text("Please scan your Parking QR Code on the scanner machine to enter.")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium, design: .rounded))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        VStack(spacing: 10) {
                            Button(action: {
                                withAnimation(.linear(duration: 0.3)) {
                                    show = false
                                }
                            }, label: {
                                
                                
                                Text("OK")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 17)
                                    .padding(.horizontal, 125)                        .background(Color("AccentColor"))
                                    .cornerRadius(90)
                                    .onTapGesture{
                                        self.navigationStack.push(ParkingTicket())
                                    }
                                
                                
                            }).buttonStyle(PlainButtonStyle())
                        }
                    }
                    //                .padding()
                    .frame(width: 320, height: 470)
                    .background(Color.white)
                    .cornerRadius(25)
                }
            }
        }
    }
}
struct ArrivedNotf1 : View {
    
    @Binding var show : Bool
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            
            VStack(spacing: 25) {
                
                AlertPopup()
                
                Text("Successful!")
                    .font(.title)
                    .foregroundColor(Color("AccentColor"))
                
                Text("Successfully made payment for your parking")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .light, design: .rounded))
                
                Button(action: {}) {
                    
                    Text("View Parking Ticket")
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)                        .background(Color("AccentColor"))
                        .cornerRadius(90)
                        .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
                    
                }
                
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(Color.white)
            .cornerRadius(25)
            
        }
    }
}

struct TriptoLoc_Previews: PreviewProvider {
    static var previews: some View {
        TriptoLoc()
    }
}
