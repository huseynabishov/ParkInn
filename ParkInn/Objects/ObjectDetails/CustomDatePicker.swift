//
//  DatePicker.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 11.07.2022.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Binding var currentDate: Date
    
    @State var currentMonth: Int = 0
    
    var body: some View {
        VStack(spacing: 35){
            
            // Days...
            let days: [String] =
            ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            
            
            HStack(spacing: 20){
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("2022")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("September")
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0)
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            // Day View...
            
            HStack(spacing: 0){
                ForEach(days,id: \.self){day in
                    
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            // Dates...
            // Lazy Grid...
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                
                ForEach(extractDate()){value in
                    
                    Text("\(value.day)")
                        .font(.title3.bold())
                }
            }
            
            
        }
    }
    
    func extractDate()->[DateValue]{
        
        let calendar = Calendar.current
        
        // Getting Current Month Date...
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth,to: Date()) else{
            return[]
        }
        
        return currentMonth.getAllDates().compactMap{ date -> DateValue
            in
            
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        BookParkingDetails()
    }
}



extension Date{
    
    func getAllDates()->[Date]{
        
        let calendar = Calendar.current
        
        // getting start Date...
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        var range = calendar.range(of: .day, in: .month, for: startDate)!
        range.removeLast()
        
        // getting date...
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day == 1 ? 0 : day, to: startDate)!
        }
    }
}
