//
//  SearhByCoordinatesViewController.m
//  weatherAppObj
//
//  Created by Andrea González García on 15/4/18.
//  Copyright © 2018 Andrea González García. All rights reserved.
//

#import "SearhByCoordinatesViewController.h"
#import "Utils.h"
#import "FlowManager.h"
#import <CoreLocation/CoreLocation.h>

@interface SearhByCoordinatesViewController () <MKMapViewDelegate,CLLocationManagerDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UITextField *latTextField;
@property (weak, nonatomic) IBOutlet UITextField *lonTextField;

@property (weak, nonatomic) IBOutlet MKMapView *mapKit;

@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *humedityLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UIImageView *stateImage;

@property (weak, nonatomic) IBOutlet UIView *rainContentView;
@property (weak, nonatomic) IBOutlet UIView *humedityContentView;
@property (weak, nonatomic) IBOutlet UIView *windContentView;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation SearhByCoordinatesViewController

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
    self.searchButton.layer.borderColor = [UIColor colorNamed:@"Salmon"].CGColor;
    self.searchButton.layer.borderWidth = 3;
    
    self.rainContentView.layer.cornerRadius = self.rainContentView.frame.size.height/2;
    self.humedityContentView.layer.cornerRadius = self.humedityContentView.frame.size.height/2;
    self.windContentView.layer.cornerRadius = self.windContentView.frame.size.height/2;
    
    self.humedityContentView.layer.borderColor = [UIColor colorNamed:@"Salmon"].CGColor;
    self.humedityContentView.layer.borderWidth = 1;
    
    self.windContentView.layer.borderColor = [UIColor colorNamed:@"Salmon"].CGColor;
    self.windContentView.layer.borderWidth = 1;
    
    self.rainContentView.layer.borderColor = [UIColor colorNamed:@"Salmon"].CGColor;
    self.rainContentView.layer.borderWidth = 1;
    
    self.mapKit.delegate = self;
    
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.delegate = self;
    self.latTextField.text = [NSString stringWithFormat:@"%f",self.locationManager.location.coordinate.latitude];
    self.lonTextField.text = [NSString stringWithFormat:@"%f",self.locationManager.location.coordinate.longitude];
    self.lonTextField.delegate = self;
    self.latTextField.delegate = self;

    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
    annotation.coordinate = self.locationManager.location.coordinate;
    [self.mapKit addAnnotation:annotation];
    
    UITapGestureRecognizer *tapRec = [[UITapGestureRecognizer alloc]
                                      initWithTarget:self action:@selector(mapDidTap:)];
    [self.mapKit addGestureRecognizer:tapRec];
    
    [self userDidTapSearch:0];
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [self.view endEditing:YES];
    return YES;
}

-(void)mapDidTap:(UITapGestureRecognizer *)gestureRecognizer {
    
    [self.mapKit removeAnnotations:_mapKit.annotations];
    
    CGPoint point = [gestureRecognizer locationInView:self.mapKit];
    CLLocationCoordinate2D tapPoint = [self.mapKit convertPoint:point toCoordinateFromView:self.mapKit];
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
    annotation.coordinate = tapPoint;
    annotation.title = @"Posición selecuionada";
    
    self.lonTextField.text = [NSString stringWithFormat:@"%f",tapPoint.longitude];
    self.latTextField.text = [NSString stringWithFormat:@"%f",tapPoint.latitude];
    
    [self.mapKit addAnnotation:annotation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

- (IBAction)userDidTapSearch:(id)sender {
    
    [self.view endEditing:YES];
    
    if (self.latTextField.text.length > 0 && self.lonTextField.text.length > 0)
    {
        [Utils startLoadingInView:self.view];
        
        FlowManager *flowManager = [[FlowManager alloc]init];
        flowManager.currentView = ByCoordinates;
        flowManager.viewControllerByCoordinates = self;
        
        [flowManager getCurrentWeather:[NSString stringWithFormat:@"%@,%@",self.latTextField.text,self.lonTextField.text]];
    }
    else {
        [Utils showAlertView:self textMessage:@"Debes rellenar todos los campos o selecionar en el mapa el lugar sobre el que quieres buscar información."];
    }
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
    
}

@end
