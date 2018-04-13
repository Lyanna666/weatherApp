//
//  dataModel.swift
//  weatherApp
//
//  Created by Andrea González García on 6/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

public func getCurrentDay () -> String {
    
    let date = Date()
    let formatter = DateFormatter()
    
    formatter.locale = Locale(identifier: "es_ES")
    formatter.dateFormat = "EEEE, dd 'de' MMMM yyyy"
    
    let currentDate = (formatter.string(from: date))
    
    return currentDate.capitalized
}

public func getCurrentHour () -> String {
    
    let date = Date()
    let formatter = DateFormatter()
    
    formatter.locale = Locale(identifier: "es_ES")
    formatter.dateFormat = "HH:mm:ss"
    
    let currentTime = (formatter.string(from: date))
    
    return currentTime;
}

public func getCountryName(countryCode: String) -> String? {
    let current = Locale(identifier: "es_ES")
    return current.localizedString(forRegionCode: countryCode) ?? nil
}

public func degreesToRadians(degrees: CGFloat) -> CGFloat {
    return degrees * CGFloat(CGFloat.pi / 180)
}

public func showLoadingView (view: UIView) {
    
    let loadingHub = MBProgressHUD.showAdded(to:view, animated: true)
    loadingHub.bezelView.backgroundColor = UIColor.clear
    loadingHub.bezelView.style = MBProgressHUDBackgroundStyle.blur
    loadingHub.backgroundView.layer.cornerRadius = loadingHub.backgroundView.frame.height/4
    loadingHub.label.text = "Cargando"
    loadingHub.label.font =  UIFont (name: "Decima Nova Pro", size: 17)
}

public func dismissLoadingView (view: UIView) {
    
    MBProgressHUD.hide(for:view, animated: true)
}

