//
//  PhoneNumber.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.06.2022.
//

import SwiftUI

struct PhoneNumber: View {
    
    @State var textFieldText: String = ""
    @State var email = ""
    
    var body: some View {
        
        
        HStack() {
            HStack {
                Image(systemName: "phone.fill")
                    .opacity(0.3)
                
                TextField("Phone Number", text: self.$textFieldText)
            }
            .padding()
            .background(Color.gray.opacity(0.06).cornerRadius(10))
        }
        .padding(.leading)
        .padding(.trailing)
    }
}

struct PhoneNumber_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumber()
    }
}
