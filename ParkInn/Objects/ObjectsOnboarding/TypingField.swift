//
//  TypingField.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 13.06.2022.
//

import SwiftUI

struct TypingField: View {
    

    @State var email = ""
    
    
    
    var body: some View {
        

            HStack() {
                HStack {
                    Image(systemName: "envelope.fill")
                        .opacity(0.3)
                    
                    TextField("Email", text: self.$email)
                }
                .padding()
                .background(Color.gray.opacity(0.06).cornerRadius(10))
            }
            .padding(.leading)
            .padding(.trailing)
    }
}

struct TypingField_Previews: PreviewProvider {
    static var previews: some View {
        TypingField()
    }
}
