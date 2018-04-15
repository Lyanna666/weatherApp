//
//  ViewController.m
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *searchByNameButton;
@property (weak, nonatomic) IBOutlet UIButton *searchByCoordinatesButton;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchByNameButton.layer.cornerRadius = self.searchByNameButton.frame.size.height /2;
    self.searchByCoordinatesButton.layer.cornerRadius = self.searchByCoordinatesButton.frame.size.height/2;
    self.searchByCoordinatesButton.layer.borderColor = UIColor.blackColor.CGColor;
    self.searchByCoordinatesButton.layer.borderWidth = 1;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
