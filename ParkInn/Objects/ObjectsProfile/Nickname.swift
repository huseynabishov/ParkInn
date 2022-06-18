//
//  Nickname.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.06.2022.
//

import SwiftUI

struct Nickname: View {
    @State var textFieldText: String = ""
    

    
    
    var body: some View {
        

            HStack() {
                TextField("Nickname", text: self.$textFieldText)
            .padding()
            .background(Color.gray.opacity(0.06).cornerRadius(10))
            }
            .padding(.leading)
            .padding(.trailing)
    }
}

struct Nickname_Previews: PreviewProvider {
    static var previews: some View {
        Nickname()
    }
}
