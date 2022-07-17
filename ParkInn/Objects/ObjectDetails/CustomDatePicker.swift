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
    
    @State var width: CGFloat = 0
    //    @State var width1: CGFloat = 15
    var totalWidth = UIScreen.main.bounds.width - 45
    
    @State private var pickinn = Date()
    @State private var pickinn1 = Date()
    
    var body: some View {
        VStack(spacing: 0){
            
            // Days...
            let days: [String] =
            ["Mo","Tu","We","Th","Fr","Sa","Su"]
            
            
            HStack(spacing: 10){
                
                VStack(alignment: .leading, spacing: 10) {
                    
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
                                .frame(width: 45, height: 45)
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
        .background(Color("ButtonColor").cornerRadius(30).opacity(0.4))
        .padding()
        
        .onChange(of: currentMonth) { newValue in
            
            // updating Month...
            currentDate = getCurrentMonth()
        }
        
        VStack(spacing: 3){
            
            Text("Duration")
                .font(.title2.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            ZStack(alignment: .bottom){
                ZStack(alignment: .leading) {
                    
                    Rectangle()
                        .fill(Color.black.opacity(0.1))
                        .frame(height: 7)
                        .cornerRadius(15)
                    
                    Rectangle()
                        .fill(Color("AccentColor"))
                        .frame(width: self.width, height: 7)
                        .cornerRadius(15)
                    
                    HStack(){
                        VStack(spacing: 0){
                            
                            ZStack{
                                DistanceField()
                                Text("\(self.getValue(val: self.width)) hrs")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                                    .fixedSize(horizontal: true, vertical: false)
                                    .frame(alignment: .center)
                                    .padding(.bottom, 13)
                            }
                            
                            ZStack(){
                                Circle()
                                    .fill(Color("AccentColor"))
                                    .frame(width: 25, height: 25)
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 15, height: 15)
                            }
                            
                        }
                        .padding(.bottom,40)
                        .offset(x: self.width - 20)
                        .gesture(
                            
                            DragGesture()
                                .onChanged({ (value) in
                                    
                                    if value.location.x >= 0 && value.location.x <= self.totalWidth{
                                        self.width = value.location.x
                                    }
                                }))
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                
                
                HStack(spacing: 0){
                    Text("Start Hour")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding([.top,.leading])
                    Spacer()
                    Text("End Hour")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding(.top)
                        .padding(.trailing, 80)
                }
            }
        }
        Spacer()
        
        HStack{
        DatePicker("", selection: $pickinn, displayedComponents: .hourAndMinute)
            .labelsHidden()
            .transformEffect(.init(scaleX: 1.1, y: 1.0))
            .padding(.leading)
            
                Image(systemName: "clock")
                .font(.system(size: 20))
                .padding(.leading)
            Spacer()
            
            Image(systemName: "arrowtriangle.forward.fill")
                .padding(.trailing)
            
            
            DatePicker("", selection: $pickinn1, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .transformEffect(.init(scaleX: 1.1, y: 1.0))
                .padding(.leading)
                
                    Image(systemName: "clock")
                    .font(.system(size: 20))
                    .padding(.leading)
                    .padding(.trailing)
        }
        Spacer()
        
        HStack{
        Text("Total")
            .foregroundColor(.black)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .padding()
            Spacer()
        }
        HStack{
        Text("$8.00")
                .foregroundColor(Color("AccentColor"))
                .font(.system(size: 30, weight: .semibold, design: .rounded))
            Text("/ 4 hours")
                .foregroundColor(.black.opacity(0.6))
                .font(.system(size: 15, weight: .semibold, design: .rounded))
            Spacer()
        }
        .padding(.leading)
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
                        .font(.system(size: 14))
                    
                }
            }
        }
        .padding(.vertical)
        .frame(height: 35, alignment: .center)
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
    
    func getValue(val: CGFloat) -> String{
        
        return String(format: "%.f", val)
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
