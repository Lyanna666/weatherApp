//
//  dataModel.swift
//  weatherApp
//
//  Created by Andrea González García on 6/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import Foundation

func getCurrentDay () -> String {
    
    let date = Date()
    let formatter = DateFormatter()
    
    formatter.locale = Locale(identifier: "es_ES")
    formatter.dateFormat = "EEEE, dd 'de' MMMM yyyy"
    
    let currentDate = (formatter.string(from: date))
    
    return currentDate.capitalized
}

func getCurrentHour () -> String {
    
    let date = Date()
    let formatter = DateFormatter()
    
    formatter.locale = Locale(identifier: "es_ES")
    formatter.dateFormat = "HH:mm:ss"
    
    let currentTime = (formatter.string(from: date))
    
    return currentTime;
}
