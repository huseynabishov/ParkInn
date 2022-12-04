//
//  Application.swift
//  ParkInn
//
//  Created by Huseyn Abishov on 5.12.2022.
//

import SwiftUI

final class ApplicationUtility {
    
    static var rootViewController: UIViewController {
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .init()
            
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
