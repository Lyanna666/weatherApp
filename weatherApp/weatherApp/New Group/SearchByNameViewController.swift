//
//  SearchByNameViewController.swift
//  weatherApp
//
//  Created by Andrea González García on 7/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import UIKit

class SearchByNameViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var currentWeatherView: UIView!
    @IBOutlet weak var contentForecastView: UIView!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var cloudImage: UIImageView!
    
    @IBOutlet weak var imageDay1: UIImageView!
    @IBOutlet weak var imageDay2: UIImageView!
    @IBOutlet weak var imageDay3: UIImageView!
    @IBOutlet weak var imageDay4: UIImageView!
    @IBOutlet weak var imageDay5: UIImageView!
    @IBOutlet weak var imageDay6: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var cloudsStateLabel: UILabel!
    
    @IBOutlet weak var day1Label: UILabel!
    @IBOutlet weak var day2Label: UILabel!
    @IBOutlet weak var day3Label: UILabel!
    @IBOutlet weak var day4Label: UILabel!
    @IBOutlet weak var day5Label: UILabel!
    @IBOutlet weak var day6Label: UILabel!
    
    @IBOutlet weak var temp1Label: UILabel!
    @IBOutlet weak var temp2Label: UILabel!
    @IBOutlet weak var temp3Label: UILabel!
    @IBOutlet weak var temp4Label: UILabel!
    @IBOutlet weak var temp5Label: UILabel!
    @IBOutlet weak var temp6Label: UILabel!
    
    var base:Base!
    var flowManager:FlowManager?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false;
        buildView()
    }
    
    func buildView() {
        self.currentWeatherView.layer.cornerRadius = 5
        self.currentWeatherView.isHidden = true
        
        self.contentForecastView.layer.cornerRadius = 5
        self.contentForecastView.isHidden = true
        
        self.cityTextField.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissLoading() {
        hideLoadingView(view: self.view)
    }
    
    func showLoading() {
        showLoadingView(view: self.view)
    }
    
    func webServiceFailed() {
        self.dismissLoading()
        
        showAlertView(view: self, textMessage:"Ha ocurrido un error, intentalo más tarde.");
    }
    
    func webServiceDidOk(base:Base) {
        let delayTime = DispatchTime.now() + .seconds(4)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.dismissLoading()
            self.base = base
            self.printNewData()
        }
    }
    
    func printNewData() {
        self.currentWeatherView.isHidden = false
        self.contentForecastView.isHidden = false
        
        self.cloudImage.image = imageFromUrl(urlString: (base.current.condition.icon)!)
        self.cloudsStateLabel.text = traslateConditionByCode(code: base.current.condition.code!)
        
        self.humidityLabel.text = "Humedad: "+String(base.current.humidity)+"%"
        self.rainLabel.text = "Precipitaciones: "+String(base.current.precip_mm)+"%"
        self.temperatureLabel.text = String(base.current.temp_c)+"ºc"
        
        self.countryNameLabel.text = base.location.country
        self.cityNameLabel.text = base.location.name
        self.currentDateLabel.text = getCurrentDay()
    
        var forecast:Forecastday = base.forecast.forecastday![1]
    
        self.day1Label.text = getDayString(date: transformStringToDate(format:"yyyy-MM-dd", dateString: forecast.date!))
        self.imageDay1.image = imageFromUrl(urlString: (forecast.day.condition?.icon)!)
        self.temp1Label.text = String(forecast.day.avgtemp_c)+"ºc"
        
        forecast = base.forecast.forecastday![2]
        
        self.day2Label.text = getDayString(date: transformStringToDate(format:"yyyy-MM-dd", dateString: forecast.date!))
        self.imageDay2.image = imageFromUrl(urlString: (forecast.day.condition?.icon)!)
        self.temp2Label.text = String(forecast.day.avgtemp_c)+"ºc"
        
        forecast = base.forecast.forecastday![3]
        
        self.day3Label.text = getDayString(date: transformStringToDate(format:"yyyy-MM-dd", dateString: forecast.date!))
        self.imageDay3.image = imageFromUrl(urlString: (forecast.day.condition?.icon)!)
        self.temp3Label.text = String(forecast.day.avgtemp_c)+"ºc"
        
        forecast = base.forecast.forecastday![4]
        
        self.day4Label.text = getDayString(date: transformStringToDate(format:"yyyy-MM-dd", dateString: forecast.date!))
        self.imageDay4.image = imageFromUrl(urlString: (forecast.day.condition?.icon)!)
        self.temp4Label.text = String(forecast.day.avgtemp_c)+"ºc"
        
        forecast = base.forecast.forecastday![5]
        
        self.day5Label.text = getDayString(date: transformStringToDate(format:"yyyy-MM-dd", dateString: forecast.date!))
        self.imageDay5.image = imageFromUrl(urlString: (forecast.day.condition?.icon)!)
        self.temp5Label.text = String(forecast.day.avgtemp_c)+"ºc"
        
        forecast = base.forecast.forecastday![6]
        
        self.day6Label.text = getDayString(date: transformStringToDate(format:"yyyy-MM-dd", dateString: forecast.date!))
        self.imageDay6.image = imageFromUrl(urlString: (forecast.day.condition?.icon)!)
        self.temp6Label.text = String(forecast.day.avgtemp_c)+"ºc"
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    @IBAction func userDidTapSearchButton(_ sender: Any) {
        self.view.endEditing(true);
        if cityTextField.text?.count == 0 {
            showAlertView(view: self, textMessage:"El nombre de la ciudad no puede estar vacío.")
        } else {
            showLoading()
            flowManager =  FlowManager(cityName: cityTextField.text!)
            flowManager!.startRequestGetWeatherByCity(viewController: self)
        }
    }
}

