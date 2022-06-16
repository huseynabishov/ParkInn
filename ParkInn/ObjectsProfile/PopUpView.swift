//
//  PopUpView.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.06.2022.
//

import SwiftUI
import NavigationStack

struct PopUpView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var textFieldText: String = ""
    @EnvironmentObject private var navigationStack: NavigationStack
    @State var showNewScreen: Bool = false
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 1950)) ?? Date()
    let endingDate: Date = Date()
    
    //    var dateFormatter: DateFormatter {
    //        let formatter = DateFormatter()
    //        formatter.dateStyle = .short
    //        return formatter
    //    }
    
    var body: some View {
        //        Text(dateFormatter.string(from: selectedDate))
        //            .font(.title)
        
        VStack() {
            
            letback()
            Spacer()
            Text("What's your Birthday?")
                .foregroundColor(.black)
                .font(.system(size: 40, weight: .semibold, design: .rounded))
                .minimumScaleFactor(0.1)
            
            DatePicker("", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
                .datePickerStyle(WheelDatePickerStyle())
                .foregroundColor(Color("AccentColor"))
                .frame(width: 300, alignment: .center)
//            DatePicker("", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date]).datePickerStyle(.compact)
            Spacer()
                .frame(height: 400)
                
        }
    }
}

struct letback: View {
    
    @EnvironmentObject private var navigationStack: NavigationStack
    
    var body: some View {
        
        
        HStack(){
            Arrow(title: "arrow.left", action: {
                self.navigationStack.push(FillProfile())
            })
            Spacer()
                .frame(width: 350)
        }
        //        ZStack(alignment: .topLeading) {
        //            Color.white
        //                .edgesIgnoringSafeArea(.all)
        //            Button(action: {
        //                self.navigationStack.push(FillProfile())
        //            }, label: {
        //                Image(systemName: "xmark")
        //                    .foregroundColor(Color("AccentColor"))
        //                    .font(.largeTitle)
        //                    .padding(20)
        //            })
        //        }
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView()
    }
}
