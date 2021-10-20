//
//  String+Extension.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/20/21.
//

import Foundation

extension String {
    
    func convertToDate() -> Date? {
        let format = ISO8601DateFormatter()
        return format.date(from: self)
    }
    
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A"}
        
        return date.convertPublishedAtToTimeFrame()
    }
}
