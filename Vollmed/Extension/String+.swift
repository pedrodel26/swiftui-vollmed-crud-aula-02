//
//  String+.swift
//  Vollmed
//
//  Created by Pedro Delmondes  on 18/02/2024.
//

import Foundation

extension String {
    func convertDateStringtoReadableDate() -> String {
        let inputFormetter = DateFormatter()
        inputFormetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = inputFormetter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy 'às' HH:mm"
            return dateFormatter.string(from: date)
        }
        return ""
    }
}
