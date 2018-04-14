//
//  flowManager.swift
//  weatherApp
//
//  Created by Andrea González García on 6/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import Foundation
import UIKit

enum CurrentView  {
    case Coordinates
    case ByName
}

class FlowManager {

    private let dataManager:DataManager
    public var cityName:String!
    
    var currentView: CurrentView!
    
    var searchByNameView:SearchByNameViewController!
    var searchByCoordinatesView:SearchByCoordenatesViewController!
    
    init() {
        dataManager = DataManager(baseURL: APIModel.BaseURL, apiKey: APIModel.APIKey)
    }
    
    convenience init(cityName:String) {
        self.init()
        self.cityName = cityName
    }
    
    func startRequestGetWeatherByCity (viewController:SearchByNameViewController){
        dataManager.setFlowManager(flowManager: self)
        self.searchByNameView = viewController
        
        self.currentView = CurrentView.ByName
        
        dataManager.getWeatherByName(cityName:cityName)
    }
    
    func getWeatherByNameFinnished(stateCode:DataManagerError,base:Base?) {
        
        if (currentView == CurrentView.ByName) {
            
            switch stateCode {
            case DataManagerError.Ok:
                searchByNameView.webServiceDidOk(base: base!)
                break
            case DataManagerError.Ko:
                searchByNameView.webServiceFailed()
                break
            default:
                break
            }
        }
        else if (currentView == CurrentView.Coordinates) {
            switch stateCode {
            case DataManagerError.Ok:
                searchByCoordinatesView.webServiceDidOk(base: base!)
                break
            case DataManagerError.Ko:
                searchByCoordinatesView.webServiceFailed()
                break
            default:
                break
            }
        }
    }
    
    func startRequestGetWeatherByCoordinates (viewController:SearchByCoordenatesViewController){
        dataManager.setFlowManager(flowManager: self)
        self.searchByCoordinatesView = viewController
        
        self.currentView = CurrentView.Coordinates
        
        dataManager.getWeatherByName(cityName:cityName)
    }

}

