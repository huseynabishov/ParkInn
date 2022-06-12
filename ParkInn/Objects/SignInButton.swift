////
////  SignInButton.swift
////  ParkInn
////
////  Created by Huseyn Abishov on 12.06.2022.
////
//
import SwiftUI
//
//struct SignInButton: View {
//    let title: String
//    let action: () -> Void
//    var buttonColor: Color = Color("ButtonColor")
//    var buttonTextColor: Color = Color.white
//    var iconPath: String?
//    var iconBGColorOpacity: Double = 1
//
//
//    var body: some View {
//        Button(action: action) {
//            HStack(){
//                if(iconPath != nil){
//                    Image(iconPath!)
//                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
//                        .background(Color("IconBackground"))
//                        .opacity(iconBGColorOpacity)
//                        .clipShape(Capsule())
//                }
//
//                Text(title)
//                    .foregroundColor(.black)
//                    .font(.system(size: 18, weight: .semibold, design: .rounded))
//                    .fontWeight(.semibold)
//                    .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
//                    .background(Color.white)
//                    .overlay(RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color("ButtonColor"), lineWidth:1))
//
//
//                if(iconPath != nil){
//                    Spacer(minLength: 20)
//                }
//
//            }
//        }
//    }
//
//    struct SignInButton_Previews: PreviewProvider {
//        static var previews: some View {
//            SignInButton(title: "Continue with Facebook", action: {})    }
//
//    }
//}


struct LargeButtonStyle: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            // This is the key part, we are using both an overlay as well as cornerRadius
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(currentForegroundColor, lineWidth: 1)
        )
            .padding([.top, .bottom], 10)
            .font(Font.system(size: 19, weight: .semibold))
    }
}

struct LargeButton: View {
    
    private static let buttonHorizontalMargins: CGFloat = 20
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    private let title: String
    private let action: () -> Void
    
    // It would be nice to make this into a binding.
    private let disabled: Bool
    
    init(title: String,
         disabled: Bool = false,
         backgroundColor: Color = Color.white,
         foregroundColor: Color = Color("ButtonColor"),
         action: @escaping () -> Void) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.title = title
        self.action = action
        self.disabled = disabled
    }
    
    var body: some View {
        HStack {
            Spacer(minLength: LargeButton.buttonHorizontalMargins)
            Button(action:self.action) {
                Text(self.title)
                    .foregroundColor(Color.black)
                    .frame(maxWidth:.infinity)
            }
            .buttonStyle(LargeButtonStyle(backgroundColor: backgroundColor,
                                          foregroundColor: foregroundColor,
                                          isDisabled: disabled))
                .disabled(self.disabled)
            Spacer(minLength: LargeButton.buttonHorizontalMargins)
        }
        .frame(maxWidth:.infinity)
    }
}
    struct LargeButton_Previews: PreviewProvider {
        static var previews: some View {
            LargeButton(title: "Continue with Facebook", action: {})
        }
    }

