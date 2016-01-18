//
//  MapViewController.m
//  Tianditong
//
//  Created by antonio on 15/12/20.
//  Copyright © 2015年 VickyCao. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () <BMKMapViewDelegate,BMKLocationServiceDelegate>{
    IBOutlet UIView *localMapView;
    BMKMapView *_mapView;
    BMKLocationService *_locService;
    BMKUserLocation *_userLocation;
}

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _mapView = [[BMKMapView alloc] initWithFrame:localMapView.bounds];
    [localMapView addSubview:_mapView];
   
    NSLog(@"!!!!!!!!!!!!!!!");
    
    //初始化BMKLocationService
    _locService = [[BMKLocationService alloc]init];
    _locService.delegate = self;
    //启动LocationService
    [_locService startUserLocationService];
    _userLocation = _locService.userLocation;
    [self Region];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _mapView.frame = localMapView.bounds;
}


-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
}

- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    NSLog(@"heading is %@",userLocation.heading);
}
//处理位置坐标更新
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    
    [self Region];
}

-(void)Region{
    CLLocationCoordinate2D coor;
    coor.latitude = _userLocation.location.coordinate.latitude;
    coor.longitude = _userLocation.location.coordinate.longitude;
    
    NSDictionary *tip = BMKConvertBaiduCoorFrom(coor,BMK_COORDTYPE_GPS);
 
    CLLocationCoordinate2D coor1=  BMKCoorDictionaryDecode(tip);
    BMKCoordinateRegion viewRegion = BMKCoordinateRegionMake(coor1, BMKCoordinateSpanMake(0.05,0.05));
    BMKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];
    [_mapView setRegion:adjustedRegion animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
