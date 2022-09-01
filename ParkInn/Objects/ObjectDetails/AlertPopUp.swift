////
////  AlertPopUp.swift
////  ParkInn
////
////  Created by Huseyn Abishov on 1.09.2022.
////
//
//import SwiftUI
//
//struct AlertPopUp : View {
//
//    @Binding var show : Bool
//    @State var customAlert = false
//
//    var body: some View {
//
//        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
//
//            VStack(spacing: 25) {
//
//                AlertPass()
//
//                Text("Congratulations!")
//                    .font(.title)
//                    .foregroundColor(Color("AccentColor"))
//
//                Text("Your account is ready to use")
//                    .foregroundColor(.black)
//                    .font(.system(size: 17, weight: .light, design: .rounded))
//
//                Button(action: {}) {
//
//                    Text("Go to Homepage")
//                        .foregroundColor(Color.white)
//                        .fontWeight(.semibold)
//                        .padding(.vertical, 10)
//                        .padding(.horizontal, 25)                        .background(Color("AccentColor"))
//                        .cornerRadius(90)
//                        .frame(maxWidth: 370, maxHeight: 60, alignment: .center)
////                        .foregroundColor(.white)
////                        .fontWeight(.semibold)
////                        .padding(.vertical, 10)
////                        .padding(.horizontal, 25)
////                        .background(Color("AccentColor"))
////                        .clipShape(Capsule())
//
//                }
//
//            }
//            .padding(.vertical, 25)
//            .padding(.horizontal, 30)
//            .background(Color.white)
//            .cornerRadius(25)
//
//        }
//    }
//}
//
//
//struct AlertPopUp_Previews: PreviewProvider {
//    static var previews: some View {
//        AlertPopUp()
//    }
//}
