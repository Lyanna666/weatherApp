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
#import "CustomTableViewCell.h"
#import "ForecastdayModel.h"


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

@property (weak, nonatomic) IBOutlet UIView *rainContentView;
@property (weak, nonatomic) IBOutlet UIView *humedityContentView;
@property (weak, nonatomic) IBOutlet UIView *windContentView;


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
    
    self.rainContentView.layer.cornerRadius = self.rainContentView.frame.size.height/2;
    self.humedityContentView.layer.cornerRadius = self.humedityContentView.frame.size.height/2;
    self.windContentView.layer.cornerRadius = self.windContentView.frame.size.height/2;
    
    self.humedityContentView.layer.borderColor = [UIColor colorNamed:@"Salmon"].CGColor;
    self.humedityContentView.layer.borderWidth = 1;
    
    self.windContentView.layer.borderColor = [UIColor colorNamed:@"Salmon"].CGColor;
    self.windContentView.layer.borderWidth = 1;
    
    self.rainContentView.layer.borderColor = [UIColor colorNamed:@"Salmon"].CGColor;
    self.rainContentView.layer.borderWidth = 1;
}

- (void)printData:(CurrentModel *)currentModel {
    
    [Utils dismissLoadingView:self.view];
    
    self.currentModel = currentModel;
    
    self.rainLabel.text = [NSString stringWithFormat:@"%f", currentModel.precipMm];
    self.humedityLabel.text = [NSString stringWithFormat:@"%f", currentModel.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"%f Km/h", currentModel.windKph];
    
    self.tempLabel.text = [NSString stringWithFormat:@"%ld ºc", (long)currentModel.tempC];
    self.countryNameLabel.text = [NSString stringWithFormat:@"%@, %@", [currentModel.name capitalizedString],[currentModel.country capitalizedString]];

    self.stateImage.image = [Utils imageFromUrl:currentModel.icon];
    
    self.currentDateLabel.text = [Utils getCurrentDay];
    
    [self.tableView reloadData];
    
}

- (IBAction)userDidTapSearch:(id)sender {
    
    if (self.cityNameTextField.text.length > 0 )
    {
        [Utils startLoadingInView:self.view];
        
        FlowManager *flowManager = [[FlowManager alloc]init];
        flowManager.currentView = ByName;
        flowManager.viewControllerByName = self;
        
        [flowManager getCurrentWeather:self.cityNameTextField.text];
    }
    else {
        [Utils showAlertView:self textMessage:@"Debes rellenar todos los campos."];
    }
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"forecastIdentifier"];
    
    ForecastdayModel *forecastDay = self.currentModel.forecast[indexPath.row];
    
    cell.titleLabel.text = [Utils getDayString:[Utils transformStringToDate:@"yyyy-MM-dd" dateString:forecastDay.date]];
    cell.iconMax.image = [Utils imageFromUrl:forecastDay.icon];
    cell.iconMin.image = [Utils imageFromUrl:forecastDay.icon];
    cell.minLabel.text = [NSString stringWithFormat:@"%li ºc",(long)forecastDay.minT];
    cell.maxLabel.text = [NSString stringWithFormat:@"%li ºc", (long)forecastDay.maxT];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}


@end
