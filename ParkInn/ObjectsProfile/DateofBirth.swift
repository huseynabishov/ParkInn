//
//  DateofBirth.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 14.06.2022.
//

import SwiftUI
import NavigationStack


struct DateofBirth: View {
    
    @State var textFieldText: String = ""
    @EnvironmentObject private var navigationStack: NavigationStack
    @State var birthday: Date?
    
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 1950)) ?? Date()
    let endingDate: Date = Date()
    
    
    var body: some View {
        ZStack {
//            Color.white.edgesIgnoringSafeArea(.all)
            LazyVStack(alignment: .leading, spacing: 0){
                ZStack() {
                    DatePickerTextField(placeholder: "Date of Birth", date: $birthday)
                        .font(.title)
                        .padding(.horizontal,16)
                        .frame(height:54)
                        .background(Color.gray.opacity(0.06).cornerRadius(10))
                        .cornerRadius(10)
                    Button(action: {
                        
                    }) {
                        Image(systemName: "calendar")
                            .font(.system(size: 25))
                            .opacity(0.3)
                            .foregroundColor(Color.gray)
                            .padding(.leading, 316)
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
        }
    }
}

struct DatePickerTextField: UIViewRepresentable {
    
    
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    private let helper = Helper()
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }()
    
    public var placeholder: String
    @Binding public var date: Date?
    
    func makeUIView(context: Context) -> UITextField {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self.helper, action: #selector(self.helper.dateValueChanged), for: .valueChanged)
        self.textField.placeholder = self.placeholder
        self.textField.inputView = self.datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self.helper, action: #selector(self.helper.doneButtonAction))
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        self.textField.inputAccessoryView = toolbar
        
        
        self.helper.dateChanged = {
            self.date = self.datePicker.date
        }
        
        self.helper.doneButtonTapped = {
            if self.date == nil {
                self.date = self.datePicker.date
            }
            self.textField.resignFirstResponder()
        }
        
        return self.textField
        
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if let selectedDate = self.date {
            uiView.text = self.dateFormatter.string(from: selectedDate)
        }
    }
    
    //    func makeCoordinator() -> () {
    //        Coordinator()
    //    }
    
    class Helper {
        public var dateChanged: (() -> Void)?
        public var doneButtonTapped: (() -> Void)?
        
        @objc func dateValueChanged() {
            self.dateChanged?()
        }
        
        @objc func doneButtonAction() {
            self.doneButtonTapped?()
        }
    }
    //    class Coordinator {
    //
    //    }
}










//    @State var showNewScreen: Bool = false
//
//    @State var selectedDate: Date = Date()
//    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 1950)) ?? Date()
//    let endingDate: Date = Date()
//
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        return formatter
//    }
//
//    var body: some View{
//        ZStack() {            HStack() {
//            TextField("Date of Birth", text: self.$textFieldText)
//                .padding()
//                .background(Color.gray.opacity(0.06).cornerRadius(10))
//        }
//        .padding(.leading)
//        .padding(.trailing)
//            VStack {
//                Button(action: {
//                    showNewScreen.toggle()
//                }) {
//                    Spacer()
//                    Image(systemName: "calendar")
//                        .font(.system(size: 25))
//                        .opacity(0.3)
//                        .foregroundColor(Color.gray)
//                        .padding(.trailing, 25)
//                }
//            }
//        }
//    }

struct DateofBirth_Previews: PreviewProvider {
    static var previews: some View {
        DateofBirth()
    }
}
