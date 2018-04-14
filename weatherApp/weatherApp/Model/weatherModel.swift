//
//  weatherModel.swift
//  weatherApp
//
//  Created by Andrea González García on 13/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import UIKit

struct Base : Codable {
    let location : Location
    let current : Current
    let forecast : Forecast
}

struct Current : Codable {
    let last_updated_epoch : Double
    let last_updated : String
    let temp_c : Double
    let temp_f : Double
    let is_day : Double
    let condition : Condition
    let wind_mph : Double
    let wind_kph : Double
    let wind_degree : Double
    let wind_dir : String
    let pressure_mb : Double
    let pressure_in : Double
    let precip_mm : Double
    let precip_in : Double
    let humidity : Double
    let cloud : Double
    let feelslike_c : Double
    let feelslike_f : Double
    let vis_km : Double
    let vis_miles : Double
}

struct Location : Codable {
    let name : String?
    let region : String?
    let country : String?
    let lat : Double?
    let lon : Double?
    let tz_id : String?
    let localtime_epoch : Double?
    let localtime : String?
}

struct Condition : Codable {
    let text : String?
    let icon : String?
    let code : Int?
}

struct Day : Codable {
    let maxtemp_c : Double?
    let maxtemp_f : Double?
    let mDoubleemp_c : Double?
    let mDoubleemp_f : Double?
    let avgtemp_c : Double
    let avgtemp_f : Double?
    let maxwind_mph : Double?
    let maxwind_kph : Double?
    let totalprecip_mm : Double?
    let totalprecip_in : Double?
    let avgvis_km : Double?
    let avgvis_miles : Double?
    let avghumidity : Double?
    let condition : Condition?
    let uv : Double?
}

struct Forecast : Codable {
    let forecastday : [Forecastday]?
}

struct Forecastday : Codable {
    let date : String?
    let date_epoch : Double?
    let day : Day
    let astro : Astro?
}

struct Astro : Codable {
    let sunrise : String?
    let sunset : String?
    let moonrise : String?
    let moonset : String?
}
