//
//  WeatherByNameViewController.m
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import "WeatherByNameViewController.h"
#import "FlowManager.h"
#import "Utils.h"



@interface WeatherByNameViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;

@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *humedityLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UIImageView *stateImage;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WeatherByNameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buildView {
    
    self.navigationController.navigationBar.tintColor = UIColor.whiteColor;
    
    self.searchButton.layer.cornerRadius = self.searchButton.frame.size.height/2;
}

- (void)printData:(CurrentModel *)currentModel {
    
    [Utils dismissLoadingView:self.view];
}

- (IBAction)userDidTapSearch:(id)sender {
    
    [Utils startLoadingInView:self.view];
    
    FlowManager *flowManager = [[FlowManager alloc]init];
    flowManager.currentView = ByName;
    flowManager.viewControllerByName = self;
    
    [flowManager getCurrentWeather:@"Salamanca"];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"forecastIdentifier"];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}


@end
