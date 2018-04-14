//
//  SearchByCoordenatesViewController.swift
//  weatherApp
//
//  Created by Andrea González García on 14/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SearchByCoordenatesViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var contentWeatherView: UIView!
    
    @IBOutlet weak var cloudImage: UIImageView!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var rainLabel: UILabel!
    @IBOutlet weak var cloudsStateLabel: UILabel!
    
    @IBOutlet weak var latTextField: UITextField!
    @IBOutlet weak var lonTextField: UITextField!
    
    var locationManager:CLLocationManager!
    
    var base:Base!
    var flowManager:FlowManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
    }
    
    func buildView() {
        
         self.navigationController?.isNavigationBarHidden = false;
        
        self.contentWeatherView.isHidden = true
        self.contentWeatherView.layer.cornerRadius = 2
        
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        gestureRecognizer.delegate = self
        mapView.addGestureRecognizer(gestureRecognizer)

        
         determineCurrentLocation()
    }

    func determineCurrentLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            
            let lat = locationManager.location?.coordinate.latitude
            let long = locationManager.location?.coordinate.longitude
            
            lonTextField.text = "\(long ?? 0)"
            latTextField.text = "\(lat ?? 0)"
            
            userDidTapSerachButton(0)
            
//            locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
    
    @objc func handleTap(_ gestureReconizer: UILongPressGestureRecognizer) {
        
        let location = gestureReconizer.location(in: mapView)
        let coordinate = mapView.convert(location,toCoordinateFrom: mapView)
        
        mapView.removeAnnotations(mapView.annotations)
        
        lonTextField.text = "\(coordinate.longitude )"
        latTextField.text = "\(coordinate.latitude )"
        
        // Add annotation:
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printNewData() {
        self.contentWeatherView.isHidden = false
        
        self.cloudImage.image = imageFromUrl(urlString: (base.current.condition.icon)!)
        self.cloudsStateLabel.text = traslateConditionByCode(code: base.current.condition.code!)
        
        self.humidityLabel.text = "Humedad: "+String(base.current.humidity)+"%"
        self.rainLabel.text = "Precipitaciones: "+String(base.current.precip_mm)+"%"
        self.temperatureLabel.text = String(base.current.temp_c)+"ºc"
        
        self.countryNameLabel.text = base.location.country
        self.cityNameLabel.text = base.location.name
        self.currentDateLabel.text = getCurrentDay()
    }

    func dismissLoading() {
        hideLoadingView(view: self.view)
    }
    
    func showLoading() {
        showLoadingView(view: self.view)
    }
    
    func webServiceDidOk(base:Base) {
        let delayTime = DispatchTime.now() + .seconds(4)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            self.dismissLoading()
            self.base = base
            self.printNewData()
        }
    }
    
    func webServiceFailed() {
        self.dismissLoading()
        
        showAlertView(view: self, textMessage:"Ha ocurrido un error, intentalo más tarde.");
    }
    
    @IBAction func userDidTapSerachButton(_ sender: Any) {
        
        if (self.latTextField.text?.count == 0 || self.lonTextField.text?.count == 0)
        {
            showAlertView(view: self, textMessage:"No puedes dejar ningún campo vacío.")
        }
        else {
            showLoadingView(view: self.view)
            
            flowManager =  FlowManager(cityName:self.latTextField.text!+","+self.lonTextField.text!)
            flowManager!.startRequestGetWeatherByCoordinates(viewController: self)
            
        }
        
    }
}
