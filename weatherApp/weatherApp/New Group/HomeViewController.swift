//
//  ViewController.swift
//  weatherApp
//
//  Created by Andrea González García on 6/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var hourLabel: UILabel?
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var searchByNameButton: UIButton!
    @IBOutlet weak var searchByCoordinatesButton: UIButton!
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    
        buildView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    @objc func timeNotify() {
        
        self.dateLabel?.text = getCurrentDay()
        self.hourLabel?.text = getCurrentHour()
        
    }
    
    func buildView() {
        
        self.searchByNameButton.layer.cornerRadius = self.searchByNameButton.frame.height/3;
        self.searchByCoordinatesButton.layer.cornerRadius = self.searchByNameButton.frame.height/3;
        
         Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timeNotify), userInfo: nil, repeats: true)
    }


    //MARK: Actions
    
    @IBAction func userDidTapButton(_ sender: UIButton) {
        
    }
    

}

