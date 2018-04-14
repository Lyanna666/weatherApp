//
//  flowManager.swift
//  weatherApp
//
//  Created by Andrea González García on 6/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

enum DataManagerError: Error {
    case Ok
    case Ko
    case Loading
}

final class DataManager {
    
    let baseURL: URL
    let apiKey: String
    
    var base:Base!
    var flowManager:FlowManager!
    
    typealias WeatherDataCompletion = (AnyObject?, DataManagerError?) -> ()
    
    // MARK: - Initialice
    
    init(baseURL: URL, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func setFlowManager(flowManager:FlowManager) {
        self.flowManager = flowManager
    }
    
    func getWeatherByName(cityName: String) {
        
        APIModel.cityName = cityName
        let cityUrl = APIModel.getSearchByCityUrl
        var responseState = DataManagerError.Loading
//        self.base = 
        
        Alamofire.request(cityUrl).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            let result = response.result.value
            print(result ?? String())
            if (result != nil) {
                
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        responseState = DataManagerError.Ok
                        let data = response.data
                        let decoder = JSONDecoder()
                        self.base = try! decoder.decode(Base.self, from: data!)
                        self.flowManager.getWeatherByNameFinnished(stateCode: responseState, base:self.base);
                        
                        break;
                    default:
                        responseState = DataManagerError.Ko
                        self.flowManager.getWeatherByNameFinnished(stateCode: responseState, base:self.base);
                        
                    }
                }
            }
            else {
                responseState = DataManagerError.Ko
                self.flowManager.getWeatherByNameFinnished(stateCode: responseState, base:self.base);
            }
        }
    }
}

