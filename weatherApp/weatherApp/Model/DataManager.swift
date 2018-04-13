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
    
    case Unknown
    case FailedRequest
    case InvalidResponse
    
}

final class DataManager {
    
    let baseURL: URL
    let apiKey: String
    
    typealias WeatherDataCompletion = (AnyObject?, DataManagerError?) -> ()
    
    // MARK: - Initialice
    
    init(baseURL: URL, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func getWeatherByName(cityName: String) {
        
        var components = URLComponents(string: baseURL.absoluteString)!
        
        components.queryItems = [URLQueryItem(name: "key", value: apiKey), URLQueryItem(name: "q", value: cityName)]
        NSLog("\(components.url!)")
        
        let url = WeatherModel.getSearchByCityUrl
    
        Alamofire.request(components.url!).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
}

