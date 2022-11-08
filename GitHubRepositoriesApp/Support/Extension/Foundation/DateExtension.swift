//
//  DateExtension.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 08/11/2022.
//

import Foundation
extension Date {
    func dateFormatTimeToString(format:String = "dd/MM/yyyy") -> String {
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = format
         dateFormatter.locale = Locale(identifier: "EH")
         return dateFormatter.string(from: self)
     }
}

