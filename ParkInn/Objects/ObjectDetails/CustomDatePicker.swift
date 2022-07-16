//
//  DatePicker.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 11.07.2022.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Binding var currentDate: Date
    
    // Month update on arrow button clicks...
    @State var currentMonth: Int = 0
    
    var body: some View {
        VStack(spacing: 15){
            
            // Days...
            let days: [String] =
            ["Mo","Tu","We","Th","Fr","Sa","Su"]
            
            
            HStack(spacing: 20){
                
                VStack(alignment: .leading, spacing: 10) {
                    
//                    Text("Select Date")
//                        .foregroundColor(.black)
//                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    
                    
                    Text(extraDate()[1] + extraDate()[0])
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
                
                Spacer(minLength: 0)
                
                Button {
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    withAnimation{
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            // Day View...
            
            HStack(spacing: 10){
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
                    
                    CardView(value: value)
                        .background(
                        
                        Circle()
                            .fill(Color("AccentColor"))
                            .frame(width: 40, height: 40)
                            .padding(.horizontal)
                            .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
            
            Spacer()
        }
        .padding()
        
        
        .onChange(of: currentMonth) { newValue in
            
            // updating Month...
            currentDate = getCurrentMonth()
        }
        
        VStack(spacing: 15){
            
            Text("Duration")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let task = tasks.first(where: { task in
                return isSameDay(date1: task.taskDate, date2: currentDate)
            }){
                
                ForEach(task.task){task in
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        // For Custom Timing...
                        Text(task.time
                            .addingTimeInterval(CGFloat
                                .random(in: 0...5000)),style:
                                .time)
                        
                        Text(task.title)
                            .font(.title2.bold())
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                    
                        Color("Pink")
                            .opacity(0.5)
                            .clipShape(Capsule())
                    )
                }
                
            }else{
                Text("No Task Found")
            }
        }
        Spacer()
    }
    
    @ViewBuilder
    func CardView(value: DateValue)->some View{
        
        VStack{
            
            if value.day != -1{
                
                if let task = tasks.first(where: { task in
                    
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }){
                    Text("\(value.day)")
//                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                }else{
                    
                    
                    Text("\(value.day)")
//                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : Color.black.opacity(0.6))
                        .frame(maxWidth: .infinity)
                    
                }
            }
        }
        .padding(.vertical)
        .frame(height: 20, alignment: .center)
    }
    
    // checking dates...
    func isSameDay(date1: Date, date2: Date)->Bool{
        let calendar = Calendar.current
        
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    //extracting Year and Month for display...
    func extraDate()->[String]{
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()->Date{
        
        let calendar = Calendar.current
        
        // Getting Current Month Date...
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        
        return currentMonth
    }
    
    func extractDate()->[DateValue]{
        
        let calendar = Calendar.current
        
        // Getting Current Month Date...
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap{ date -> DateValue
            in
            
            // getting day...
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        
        // adding offset days to get exact week day...
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
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
        
        // getting date...
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
