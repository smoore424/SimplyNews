//
//  Date+Extension.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/20/21.
//

import Foundation

extension Date {
    
    func convertPublishedAtToTimeFrame() -> String {

        let secondsAgo = Int(Date().timeIntervalSince(self))
        
        let minute = 60
        let hour = minute * 60
        let day = hour * 24
        let week = day * 7
        
        //TODO: put into Switch statement
        if secondsAgo < minute {
            return "\(secondsAgo) seconds ago"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute) minutes ago"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour) hours ago"
        } else if secondsAgo < week {
            return "\(secondsAgo / day) days ago"
        }
        return "\(secondsAgo / week) weeks ago"
    }
}

