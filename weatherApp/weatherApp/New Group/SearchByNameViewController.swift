//
//  SearchByNameViewController.swift
//  weatherApp
//
//  Created by Andrea González García on 7/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import UIKit

class SearchByNameViewController: UIViewController {
    
    @IBOutlet weak var cityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userDidTapSearchButton(_ sender: Any) {
        
        showLoadingView(view: self.view)
        
        FlowManager(cityName: cityTextField.text!).userDidTapButton(tagButton:0)
    }
}
