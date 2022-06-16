//
//  EmailFill.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.06.2022.
//

import SwiftUI

struct EmailFill: View {
    
    @State var textFieldText: String = ""
    @State var email = ""
    
    
    var body: some View {
        
        
        HStack() {
            HStack {
                TextField("Email", text: self.$email)
                
                
                Image(systemName: "envelope.fill")
                    .font(.system(size: 25))
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
            }
            .padding()
            .background(Color.gray.opacity(0.06).cornerRadius(10))
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct EmailFill_Previews: PreviewProvider {
    static var previews: some View {
        EmailFill()
    }
}
