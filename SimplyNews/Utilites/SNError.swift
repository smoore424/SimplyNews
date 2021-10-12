//
//  SNError.swift
//  SimplyNews
//
//  Created by Stacey Moore on 10/11/21.
//

import Foundation

enum SNError: String, Error {
    case invalidURL = "The url is incorrect, please contact the system administator or try again"
    case unableToComplete = "Unable to complete request. Please check your internet connection and try again"
    case invalidResponse = "The server returned and invalid response. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
}
