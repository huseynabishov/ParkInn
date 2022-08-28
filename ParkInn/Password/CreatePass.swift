//
//  CreatePass.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 16.06.2022.
//

import SwiftUI
import NavigationStack

struct CreatePass: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    @State var password = ""
    @State private var isSecured: Bool = true
    @State var customAlert = false
    @State private var showingPopover = false
    
    var body: some View {
        ZStack{
        
            VStack(alignment: .center, spacing: 0, content: {
            VStack(spacing: 2, content: {
            HStack{
                Arrow(title: "arrow.left", action: {
                    navigationStack.pop(to: .view(withId: "ForgetPasswordId"))
                })
                    .padding(.trailing,4)
                Text("Create New Password")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .semibold, design: .rounded))
                Spacer()
                    .frame(width: 49)
                    .padding()
            }
            .padding(.top, 12)
            Image("MyPass")
                .resizable()
                .scaledToFill()
                .frame(width: 380, height: 380, alignment: .center)
                .padding(.bottom)
            })
            Text("Create Your New Password")
                .foregroundColor(.black)
                .font(.system(size: 17, weight: .light, design: .rounded))
                .padding(.trailing, 170)
                Spacer()
                    .frame(height: 20)
            PassFill()
                Spacer()
                    .frame(height: 25)
                HStack(){
                    CheckView(title: "")
                    Text("Remember me")
                }
                .padding(.bottom,20)
            CustomButton(title: "Continue", action: {
                showingPopover = true
            })
            .opacity(0.7)
            .padding(.top, 55)
            .padding(.bottom, 20)
        })
        .padding(.bottom, 0)
            
            PopUpWindow(action: {
                self.navigationStack.push(CreateAcc())
            }, title: "", message: "", buttonText: "", show: $showingPopover)

        }
    }
}


struct PopUpWindow: View {
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
                    
                    Text("Congratulations!")
                        .font(.system(size: 30, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("AccentColor"))
                    Text("Your account is ready to use")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .light, design: .rounded))
                    
                    Button(action: {
                        withAnimation(.linear(duration: 0.3)) {
                            show = false
                        }
                    }, label: {
                        
                        
                        Text("Go to Homepage")
                            .foregroundColor(Color.white)
                            .fontWeight(.semibold)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 60)                        .background(Color("AccentColor"))
                            .cornerRadius(90)
                            .onTapGesture{
                                action()
                            }
                            
                        
                    }).buttonStyle(PlainButtonStyle())
                }
//                .padding()
                .frame(width: 310, height: 420)
                .background(Color.white)
                .cornerRadius(25)
                }
            }
        }
    }
}

struct CustomAlertView : View {
    
    @Binding var show : Bool
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            
            VStack(spacing: 25) {
                
                AlertPass()
                
                Text("Congratulations!")
                    .font(.title)
                    .foregroundColor(Color("AccentColor"))
                
                Text("Your account is ready to use")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .light, design: .rounded))
                
                Button(action: {}) {
                    
                    Text("Go to Homepage")
                        .foregroundColor(Color.white)
                        .fontWeight(.semibold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)                        .background(Color("AccentColor"))
                        .cornerRadius(90)
                        .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
//                        .foregroundColor(.white)
//                        .fontWeight(.semibold)
//                        .padding(.vertical, 10)
//                        .padding(.horizontal, 25)
//                        .background(Color("AccentColor"))
//                        .clipShape(Capsule())
                    
                }

            }
            .padding(.vertical, 25)
            .padding(.horizontal, 30)
            .background(Color.white)
            .cornerRadius(25)
            
        }
    }
}

struct BlurView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        
    }
}



struct CreatePass_Previews: PreviewProvider {
    static var previews: some View {
        CreatePass()
    }
}
