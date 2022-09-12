//
//  ReviewSummary.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 1.09.2022.
//

import SwiftUI
import NavigationStack

struct ReviewSummary: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    
    @State var customAlert = false
    @State private var showingPopover = false
    
    @EnvironmentObject var vm: BookParkingDetailsModel
    
    var body: some View {
        ZStack{
            VStack(spacing: 0, content: {
                HStack(){
                    Arrow(title: "arrow.left", action: {
                        self.navigationStack.pop()
                    })
                    Text("Review Summary")
                        .foregroundColor(.black)
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                    
                    Spacer()
                    
                }
                
                VStack(spacing: 0) {
                    HStack(){
                        Text("Parking Area")
                            .padding()
                            .font(.callout)
                        Spacer()
                        Text("Parking Lot of San Manolia")
                            .foregroundColor(.black)
                            .font(.system(size: 17).bold())

                    }
                    
                    HStack(){
                        Text("Address")
                            .padding()
                            .font(.callout)
                        Spacer()
                        
                        Text("9569, Trantow Courts")
                            .foregroundColor(.black)
                            .font(.system(size: 17).bold())
                    }
                    
                    HStack(){
                        Text("Vehicle")
                            .padding()
                            .font(.callout)
                        Spacer()
                        
                        Text("9569, Trantow Courts")
                            .foregroundColor(.black)
                            .font(.system(size: 17).bold())
                    }

                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                .background(Color.white.cornerRadius(20))
                
                .shadow(
                    color: Color.gray.opacity(0.20),
                    radius: 10, x: 0, y: 0)
                .padding()
                
                Spacer()
                
                
                
                Text("\(vm.calculatedTotal)")
                    .foregroundColor(.black)
                
                
                
                Spacer()
                
                
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
            
            PopUpWindow1(action: {}, title: "", message: "", buttonText: "", show: $showingPopover)
        }
    }
}

struct PopUpWindow1: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    
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
                        
                        AlertPass()
                        
                        Text("Successful!")
                            .font(.system(size: 30, weight: .semibold, design: .rounded))
                            .foregroundColor(Color("AccentColor"))
                        Text("Successfully made payment for your parking")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .light, design: .rounded))
                            .multilineTextAlignment(.center)
                        
                        VStack(spacing: 10) {
                            Button(action: {
                                withAnimation(.linear(duration: 0.3)) {
                                    show = false
                                }
                            }, label: {
                                
                                
                                Text("View Parking Ticket")
                                    .foregroundColor(Color.white)
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 17)
                                    .padding(.horizontal, 60)                        .background(Color("AccentColor"))
                                    .cornerRadius(90)
                                    .onTapGesture{
                                        self.navigationStack.push(ParkingTicket())
                                    }
                                
                                
                            }).buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                                
                                withAnimation(.linear(duration: 0.3)) {
                                    show = false
                                }
                            }, label: {
                                
                                
                                Text("Cancel")
                                    .foregroundColor(Color("AccentColor"))
                                    .fontWeight(.semibold)
                                    .padding(.vertical, 17)
                                    .padding(.horizontal, 110)                        .background(Color("ButtonColor"))
                                    .cornerRadius(90)
                                    .onTapGesture{
                                        self.navigationStack.pop()
                                    }
                                
                                
                            }).buttonStyle(PlainButtonStyle())
                        }
                    }
                    //                .padding()
                    .frame(width: 320, height: 510)
                    .background(Color.white)
                    .cornerRadius(25)
                }
            }
        }
    }
}

struct CustomAlertView1 : View {
    
    @Binding var show : Bool
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            
            VStack(spacing: 25) {
                
                AlertPass()
                
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

struct BlurView1 : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        
    }
}

struct ReviewSummary_Previews: PreviewProvider {
    static var previews: some View {
        ReviewSummary()
            .environmentObject(BookParkingDetailsModel())
    }
}
