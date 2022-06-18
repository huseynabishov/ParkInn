//
//  PassFill.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 16.06.2022.
//

import SwiftUI

struct Verification: View {
    
    @State var textFieldText: String = ""
    @State var textFieldText1: String = ""
    @State var textFieldText2: String = ""
    @State var textFieldText3: String = ""
    var body: some View {
        SectionedTextField()
//            .padding(.bottom, 40)
        //        HStack() {
        //            TextField("", text: self.$textFieldText)
        //                .lineLimit(1)
        //                .multilineTextAlignment(.center)
        //                .textContentType(.oneTimeCode)
        //                .frame(maxWidth: 80, maxHeight: 70, alignment: .center)
        //                .background(Color.gray.cornerRadius(20).opacity(0.1))
        //                .overlay(RoundedRectangle(cornerRadius: 20)
        //                    .stroke(Color.gray.opacity(0.3), lineWidth:1))
        //            TextField("", text: self.$textFieldText1)
        //                .frame(maxWidth: 80, maxHeight: 70, alignment: .center)
        //                .background(Color.gray.cornerRadius(20).opacity(0.1))
        //                .overlay(RoundedRectangle(cornerRadius: 20)
        //                    .stroke(Color.gray.opacity(0.3), lineWidth:1))
        //            TextField("", text: self.$textFieldText2)
        //                .frame(maxWidth: 80, maxHeight: 70, alignment: .center)
        //                .background(Color.gray.cornerRadius(20).opacity(0.1))
        //                .overlay(RoundedRectangle(cornerRadius: 20)
        //                    .stroke(Color.gray.opacity(0.3), lineWidth:1))
        //            TextField("", text: self.$textFieldText3)
        //                .frame(maxWidth: 80, maxHeight: 70, alignment: .center)
        //                .background(Color.gray.cornerRadius(20).opacity(0.1))
        //                .overlay(RoundedRectangle(cornerRadius: 20)
        //                    .stroke(Color.gray.opacity(0.3), lineWidth:1))
        //        }
    }
    
    
}
struct SectionedTextField: View {
    @State private var numberOfCells: Int = 4
    @State private var currentlySelectedCell = 0
    
    var body: some View {
        HStack(spacing:20) {
            ForEach(0 ..< self.numberOfCells) { index in
                CharacterInputCell(currentlySelectedCell: self.$currentlySelectedCell, index: index)
            }
        }
    }
}

struct CharacterInputCell: View {
    @State private var textValue: String = ""
    @Binding var currentlySelectedCell: Int
    
    var index: Int
    
    var responder: Bool {
        return index == currentlySelectedCell
    }
    
    var body: some View {
        CustomTextField(text: $textValue, currentlySelectedCell: $currentlySelectedCell, isFirstResponder: responder)
            .frame(maxWidth: 80, maxHeight: 70, alignment: .center)
            .background(Color.gray.cornerRadius(20).opacity(0.1))
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .textContentType(.oneTimeCode)
            .overlay(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.3), lineWidth:1))

    }
}


struct CustomTextField: UIViewRepresentable {
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        @Binding var currentlySelectedCell: Int
        
        var didBecomeFirstResponder = false
        
        init(text: Binding<String>, currentlySelectedCell: Binding<Int>) {
            _text = text
            _currentlySelectedCell = currentlySelectedCell
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            
            guard let stringRange = Range(range, in: currentText) else { return false }
            
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            if updatedText.count <= 1 {
                self.currentlySelectedCell += 1
            }
            
            return updatedText.count <= 1
        }
    }
    
    @Binding var text: String
    @Binding var currentlySelectedCell: Int
    var isFirstResponder: Bool = false
    
    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.delegate = context.coordinator
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        return textField
    }
    
    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text, currentlySelectedCell: $currentlySelectedCell)
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}

struct Verification_Previews: PreviewProvider {
    static var previews: some View {
        Verification()
    }
}
