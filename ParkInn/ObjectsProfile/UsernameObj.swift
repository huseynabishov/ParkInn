//
//  UsernameObj.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.06.2022.
//

import SwiftUI

struct UsernameObj: View {
    @State var textFieldText: String = ""
    
    var buttonColor: Color = Color("ButtonColor")
    var typingcolor: Color = Color("typingcolor")
    
    
    var body: some View {
        

            HStack() {
                TextField("Full Name", text: self.$textFieldText)
            .padding()
            .background(Color.gray.opacity(0.06).cornerRadius(10))
            }
            .padding(.leading)
            .padding(.trailing)
    }
}

struct UsernameObj_Previews: PreviewProvider {
    static var previews: some View {
        UsernameObj()
    }
}

