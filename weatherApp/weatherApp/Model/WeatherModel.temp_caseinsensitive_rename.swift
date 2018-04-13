//
//  weatherModel.swift
//  weatherApp
//
//  Created by Andrea González García on 7/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import UIKit

class WeatherModel: NSObject {

    static let APIKey = "d3fd5aebb09a499aa77165755180704"
    static let BaseURL = URL(string: "https://api.apixu.com/v1/current.json")!
    
    static var cityName: String = ""
    var lat: String = ""
    var lon: String = ""
    
    static var getSearchByCityUrl: URL {
        
        var components = URLComponents(string: BaseURL.absoluteString)!
        
        components.queryItems = [URLQueryItem(name: "key", value: APIKey), URLQueryItem(name: "q", value:cityName )]
        NSLog("\(components.url!)")
        
        return components.url!
    }

    
}
