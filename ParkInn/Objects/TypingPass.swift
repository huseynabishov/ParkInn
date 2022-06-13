//
//  TypingField.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 13.06.2022.
//

import SwiftUI

struct TypingPass: View {
    
    @State var textFieldText: String = ""
    
    var buttonColor: Color = Color("ButtonColor")
    var typingcolor: Color = Color("typingcolor")
    
    
    var body: some View {
        
        NavigationView {
            HStack() {
            HStack {
                Image(systemName: "lock.fill")
                    .opacity(0.3)
                
                TextField("Password", text: $textFieldText)
                    
            }
            .padding()
            .background(Color.gray.opacity(0.06).cornerRadius(10))
            }
            .padding()
        }
    }
}

struct TypingPass_Previews: PreviewProvider {
    static var previews: some View {
        TypingPass()
    }
}
