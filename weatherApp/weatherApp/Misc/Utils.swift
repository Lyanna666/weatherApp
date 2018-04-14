//
//  Utils.swift
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

public func getDayString(date:Date) -> String {
    var day:String = ""
    
    let formatter = DateFormatter()
    
    formatter.locale = Locale(identifier: "es_ES")
    formatter.dateFormat = "EEEE"
    
    day = (formatter.string(from: date))
    
    return day.capitalized
}

public func transformStringToDate(format:String,dateString:String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    let date = dateFormatter.date(from:dateString)
    
    return date!
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

public func hideLoadingView (view: UIView) {
    
    MBProgressHUD.hide(for:view, animated: true)
}

public func imageFromUrl (urlString:String) ->(UIImage){
    let imageUrl = "http://www.apixu.com/static"+urlString.dropFirst(15)
    var image = UIImage.init()
    let data = try? Data(contentsOf:URL(string: imageUrl)!)
    
    if let imageData = data {
        image = UIImage(data: imageData)!
    }
    return image
}

public func showAlertView(view: UIViewController, textMessage: String) {
    let alert = UIAlertController(title: "Atención", message:textMessage, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
    view.present(alert, animated: true, completion: nil)
}

public func traslateConditionByCode(code:Int) -> String {
    var conditionText:String = ""
    
    switch code {
    case 100:
        conditionText = "Despejado"
        break;
    case 1003:
        conditionText = "Parcialmente nublado"
        break;
    case 1006:
        conditionText = "Nublado"
        break;
    case 1009:
        conditionText = "Cielo cubiero"
        break;
    case 1030:
        conditionText = "Con niebla"
        break;
    case 1063:
        conditionText = "Lluvia moderada"
        break;
    case 1066:
        conditionText = "Nieve moderada"
        break;
    case 1069:
        conditionText = "Aguanieve"
        break;
    case 1072:
        conditionText = "Llovizna helada"
        break;
    case 1087:
        conditionText = "Cielos tormentosos"
        break;
    case 1114:
        conditionText = "Chubascos de nieve"
        break;
    case 1117:
        conditionText = "Ventisca"
        break;
    case 1135:
        conditionText = "Niebla moderada"
        break;
    case 1145:
        conditionText = "Niebla helada"
        break;
    case 1150:
        conditionText = "Llovizna"
        break;
    case 1153:
        conditionText = "Llovizna ligera"
        break;
    case 1168:
        conditionText = "Llovizna helada"
        break;
    case 1171:
        conditionText = "Fuertes lluvias"
        break;
    case 1180:
        conditionText = "Parcialmente nublado"
        break;
    case 1183 :
        conditionText = "Lluvias"
        break;
    case 1186:
        conditionText = "Lluvias moderadas"
        break;
    case 1189:
        conditionText = "Lluvia"
        break;
    case 1192:
        conditionText = "Fuertes lluvias"
        break;
    case 1195:
        conditionText = "Fuertes lluvias"
        break;
    case 1198:
        conditionText = "Lluvias ligeras"
        break;
    case 1201 :
        conditionText = "Lluvias moderadas o fuertes"
        break;
    case 1204:
        conditionText = "Aguanieve"
        break;
    case 1207:
        conditionText = "Aguanieve"
        break;
    case 1210:
        conditionText = "Nieve"
        break;
    case 1213:
        conditionText = "Nieve ligera"
        break;
    case 1216:
        conditionText = "Nieve moderada"
        break;
    case 1219:
        conditionText = "Nieve moderada"
        break;
    case 1222:
        conditionText = "Nieve fuerte"
        break;
    case 1225 :
        conditionText = "Nieve fuerte"
        break;
    case 1237:
        conditionText = "Granizo"
        break;
    case 1240:
        conditionText = "Precipitaciones ligeras"
        break;
    case 1243:
        conditionText = "Precipitaciones moderadas"
        break;
    case 1249:
        conditionText = "Aguanieve"
        break;
    case 1252:
        conditionText = "Aguanieve"
        break;
    case 1255:
        conditionText = "Aguanieve"
        break;
    case 1258:
        conditionText = "Aguanieve"
        break;
    case 1261:
        conditionText = "Granizo"
        break;
    case 1264 :
        conditionText = "Granizo"
        break;
    case 1276:
        conditionText = "Tormenta"
        break;
    case 1273:
        conditionText = "Tormenta"
        break;
    case 1279:
        conditionText = "Tormenta"
        break;
    case 1282:
        conditionText = "Tormenta"
        break;
    default:
        conditionText = "Despejado"
        break;
    }
    
    return conditionText
}

