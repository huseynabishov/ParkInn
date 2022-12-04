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
                
                TextFieldWithCheck("Phone Number", text: self.$textFieldText,limit: 9, allowed: .decimalDigits)
                    .keyboardType(.decimalPad)
            }
            .padding()
            .background(Color.gray.opacity(0.06).cornerRadius(10))
        }
        .padding(.leading)
        .padding(.trailing)
    }
}
struct TextFieldWithCheck: View {
    
    let label: LocalizedStringKey
    @Binding var text: String
    let limit: Int
    let allowed: CharacterSet
    
    init(_ label: LocalizedStringKey, text: Binding<String>, limit: Int = Int.max, allowed: CharacterSet = .alphanumerics) {
        self.label = label
        self._text = Binding(projectedValue: text)
        self.limit = limit
        self.allowed = allowed
    }
    
    var body: some View {
        TextField(label, text: $text)
            .onChange(of: text) { _ in
                text = String(text.prefix(limit).unicodeScalars.filter(allowed.contains))
            }
    }
}

struct PhoneNumber_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumber()
    }
}
