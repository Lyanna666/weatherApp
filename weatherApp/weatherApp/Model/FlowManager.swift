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
    
    var currentView:SearchByNameViewController!
    
    init() {
        dataManager = DataManager(baseURL: APIModel.BaseURL, apiKey: APIModel.APIKey)
    }
    
    convenience init(cityName:String) {
        self.init()
        self.cityName = cityName
    }
    
    func startRequestGetWeatherByCity (viewController:SearchByNameViewController){
        dataManager.setFlowManager(flowManager: self)
        self.currentView = viewController
        dataManager.getWeatherByName(cityName:cityName)
    }
    
    func getWeatherByNameFinnished(stateCode:DataManagerError,base:Base?) {
        
//        let view:SearchByNameViewController = SearchByNameViewController()
        
        switch stateCode {
        case DataManagerError.Ok:
            currentView.webServiceDidOk(base: base!)
            break
        case DataManagerError.Ko:
            currentView.webServiceFailed()
            break
        default:
            break
        }
    }

}

