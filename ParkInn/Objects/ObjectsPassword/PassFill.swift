//
//  PassFill.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 16.06.2022.
//

import SwiftUI

struct PassFill: View {
    
    @State var password = ""
    @State private var isSecured: Bool = true
    
    var body: some View {
        VStack{
            HStack() {
                HStack {
                    if isSecured{
                        Image(systemName: "lock.fill")
                            .opacity(0.3)
                            .padding(.leading, 05)
                        
                        SecureField("Password", text: self.$password)
                        
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: "eye.slash")
                                .foregroundColor(.gray)
                                .opacity(0.5)
                        }
                    } else {
                        Image(systemName: "lock.fill")
                            .opacity(0.3)
                            .padding(.leading, 05)
                        
                        TextField("Password", text: self.$password)
                        
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: "eye")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.06).cornerRadius(10))
            }
            .padding(.leading)
            .padding(.trailing)
            
            Spacer()
                .frame(height: 20)
            HStack() {
                HStack {
                    if isSecured{
                        Image(systemName: "lock.fill")
                            .opacity(0.3)
                            .padding(.leading, 05)
                        
                        SecureField("Password", text: self.$password)
                        
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: "eye.slash")
                                .foregroundColor(.gray)
                                .opacity(0.5)
                        }
                    } else {
                        Image(systemName: "lock.fill")
                            .opacity(0.3)
                            .padding(.leading, 05)
                        
                        TextField("Password", text: self.$password)
                        
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: "eye")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.06).cornerRadius(10))
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct PassFill_Previews: PreviewProvider {
    static var previews: some View {
        PassFill()
    }
}
