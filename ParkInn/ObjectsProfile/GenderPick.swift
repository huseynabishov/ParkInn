//
//  GenderPick.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.06.2022.
//

import SwiftUI
import NavigationStack

struct GenderPick: View {
    
    
    @EnvironmentObject private var navigationStack: NavigationStack
    @State var textFieldText: String = ""
    @State var selection: String = "Gender"
    let filterOptions: [String] = [
        "Gender", "Female", "Male"
    ]
    
    
    var body: some View {
        HStack() {
            HStack {
                Picker (selection: $selection,
                        label:
                            HStack {
                    Text("Gender")
                        .frame(width: 300)
                }.frame(width: 300),
                        content: {
                    ForEach(filterOptions, id: \.self) { option in
                        Text(option)
                            .tag(option)
                            .frame(width: 300)
                    }.frame(width: 300)
                })
                .frame(width: 300)
                .pickerStyle(MenuPickerStyle())
                
                
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "arrowtriangle.down.fill")
                        .font(.system(size: 17))
                        .opacity(0.3)
                        .foregroundColor(Color.gray)
                        .padding(.trailing, 6)
                }
            }
//            .padding()
            .background(Color.gray.opacity(0.06).cornerRadius(10))
        }
//        .padding(.leading)
//        .padding(.trailing)
    }
}

struct GenderPick_Previews: PreviewProvider {
    static var previews: some View {
        GenderPick()
    }
}
