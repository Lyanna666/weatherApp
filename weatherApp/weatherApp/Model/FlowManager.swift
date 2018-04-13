//
//  flowManager.swift
//  weatherApp
//
//  Created by Andrea González García on 6/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import Foundation
import UIKit

class FlowManager {

    private let dataManager:DataManager
    public var cityName:String!
    
    init() {
        dataManager = DataManager(baseURL: API.BaseURL, apiKey: API.APIKey)
    }
    
    convenience init(cityName:String) {
        self.init()
        self.cityName = cityName
    }
    
    func userDidTapButton(tagButton: NSInteger) {
        
        switch tagButton {
        case 0:
            
            dataManager.getWeatherByName(cityName:cityName)
            
            break;
        default:
            break;
        }
    }
    
   
    
}

