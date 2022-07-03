//
//  FilterView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 29.06.2022.
//

import SwiftUI
import NavigationStack

struct FilterView: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    
    @Binding var isShowing: Bool
    
    @State private var curHeight: CGFloat = 400
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 700
    
    @State private var isDragging = false
    @State var toggleIsOn: Bool = false
    
    var body:some View {
        ZStack(alignment: .bottom){
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
    }
    
    var mainView : some View {
        VStack{
            ZStack{
                Capsule()
                    .frame(width:50,height:5)
                    .foregroundColor(Color("ButtonColor"))
                    .cornerRadius(1020)
            }
            .frame(height:40)
            .frame(maxWidth:.infinity)
            .background(Color.white.opacity(0.00001))
            .gesture(dragGesture)
            
            ZStack{
                VStack(){
                    Group{
                        Text("Filter")
                            .foregroundColor(.black)
                            .font(.system(size: 27, weight: .semibold, design: .rounded))
                        
                        Divider()
                            .background(Color("ButtonColor"))
                            .padding(.horizontal,20)
                        
                        Spacer()
                        
                        HStack() {
                            Text("Sort by")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                            Spacer()
                            
                            Button(action: {
                            }) {
                                Text("See All")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(Color("AccentColor"))
                            }
                        }
                        .padding(.horizontal,20)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing: 10){
                                FilterKindButton(title: "Distance", action: {
                                    self.navigationStack.push(NotificationMenu())
                                })
                                .padding(.leading)
                                FilterKindButton(title: "Slots Available", action: {
                                    self.navigationStack.push(NotificationMenu())
                                })
                                FilterKindButton(title: "Lower Price", action: {
                                    self.navigationStack.push(NotificationMenu())
                                })
                                FilterKindButton(title: "Popular", action: {
                                    self.navigationStack.push(NotificationMenu())
                                })
                            }
                        }
                        .padding(.top)
                        
                        .padding(.leading, 2)
                        
                        HStack{
                            Text("Distance")
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .semibold, design: .rounded))
                                .padding(.bottom, 10)
                                .padding(.top)
                            Spacer()
                        }
                        .padding(.leading, 20)
                        
                        SliderView()
                        
                        HStack{
                            Spacer()
                            
                            Toggle(
                                isOn: $toggleIsOn,
                                label: {
                                    Text("Valet Parking")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                                })
                            .toggleStyle(SwitchToggleStyle(tint: Color("AccentColor")))
                        }
                        .padding(.horizontal, 20)
                        
                    }
                    Spacer()
                    Divider()
                        .background(Color("ButtonColor"))
                        .padding(.horizontal,20)
                    
                    HStack(spacing: 15){
                        CustomButton2(title: "Reset", action: {
                            self.navigationStack.push(NotificationMenu())
                        })
                        .frame(width: 175, height: 50, alignment: .leading)
                        
                        CustomButton(title: "Apply Filter", action: {
                            self.navigationStack.push(NotificationMenu())
                        })
                        .frame(width: 175, height: 50, alignment: .leading)
                    }
                    .padding()
                }
            }
            .frame(maxHeight:.infinity)
            .padding(.bottom, 35)
        }
        .frame(height:580)
        .frame(maxWidth:.infinity)
        .background(
            // HACK for RoundedCorners only on top
            ZStack{
                RoundedRectangle(cornerRadius:30)
                Rectangle()
                    .frame(height:curHeight/2)
            }
                .foregroundColor(.white)
        )
        .animation(isDragging ? nil : .easeInOut(duration: 0.45))
    }
    
    
    @State private var prevDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                
                let dragAmount = val.translation.height - prevDragTranslation.height
                curHeight -= dragAmount
                
                prevDragTranslation = val.translation
            }
        
            .onEnded { val in
                
            }
        
    }
    
}

struct SliderView: View {
    
    @State var width: CGFloat = 0
    //    @State var width1: CGFloat = 15
    var totalWidth = UIScreen.main.bounds.width - 60
    
    var body: some View {
        
        VStack{
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .fill(Color.black.opacity(0.1))
                    .frame(height: 7)
                    .cornerRadius(15)
                
                Rectangle()
                    .fill(Color("AccentColor"))
                    .frame(width: self.width, height: 7)
                    .cornerRadius(15)
                
                HStack(){
                    VStack(spacing: 0){
                        
                        ZStack{
                            DistanceField()
                            Text("\(self.getValue(val: self.width)) km")
                                .foregroundColor(Color.white)
                                .font(.system(size: 13, weight: .semibold, design: .rounded))
                                .fixedSize(horizontal: true, vertical: false)
                                .frame(alignment: .center)
                                .padding(.bottom, 13)
                        }
                        
                        ZStack(){
                            Circle()
                                .fill(Color("AccentColor"))
                                .frame(width: 25, height: 25)
                            Circle()
                                .fill(Color.white)
                                .frame(width: 15, height: 15)
                        }
                        
                    }
                    .padding(.bottom,40)
                    .offset(x: self.width - 20)
                    .gesture(
                        
                        DragGesture()
                            .onChanged({ (value) in
                                
                                if value.location.x >= 0 && value.location.x <= self.totalWidth{
                                        self.width = value.location.x
                                }
                            }))
                }
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
    
    func getValue(val: CGFloat) -> String{
        
        return String(format: "%.f", val)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(isShowing: .constant(true))
    }
}
