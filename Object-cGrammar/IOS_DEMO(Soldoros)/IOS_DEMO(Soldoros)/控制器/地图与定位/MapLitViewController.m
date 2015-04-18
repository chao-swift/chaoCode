//
//  MapLitViewController.m
//  IOS_DEMO(Soldoros)
//
//  Created by yy on 14-10-21.
//  Copyright (c) 2014年 Soldoros. All rights reserved.
//

#import "MapLitViewController.h"

@import CoreLocation;
@import MapKit;

@interface MapLitViewController () <CLLocationManagerDelegate, MKMapViewDelegate>
{
    
    CLLocationManager *_locationManager;
    MKMapView *_mapView;
}

- (void)initializeLocationService; // 初始化定位功能
- (void)initializeAppearance; // 初始化界面
- (void)updateAppearanceWithLocation:(CLLocation *)location;

- (void)reverseGeocodeLocation:(CLLocation *)location
                    completion:(void (^)(BOOL success, id content))completion;

- (void)barButtonPressed:(UIBarButtonItem *)sender;
// 重定位
- (void)showCurrentLocation;
// 显示位置详情
- (void)showDetailInformationWithLocation:(CLLocation *)location;
// 切换地图类型
- (void)processSegmentedControl:(UISegmentedControl *)sender;
// 标注添加
- (void)processLongPressGesture:(UILongPressGestureRecognizer *)sender;

@end

@implementation MapLitViewController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Map Demo";
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self initializeLocationService];
    [self initializeAppearance];
}

- (void)initializeLocationService
{
    
    // CLLocationManager初始化
    // 判定当前定位服务是否可用
    if (![CLLocationManager locationServicesEnabled])
    {
        NSLog(@"定位服务不可用.");
        return;
    }
    _locationManager = [[CLLocationManager alloc] init];

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [_locationManager requestAlwaysAuthorization];
    }
    // 配置委托
    _locationManager.delegate = self;
    // 配置定位精度
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // 配置定位过滤，米为单位
    _locationManager.distanceFilter = 100.0f;
    // 启动定位
    if ([CLLocationManager locationServicesEnabled])
    {
        [_locationManager startUpdatingLocation];
    }
}

- (void)initializeAppearance {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 重定位
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"定位" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonPressed:)];
    leftItem.tag = 10;
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 详细信息
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"详细信息" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonPressed:)];
    rightItem.tag = 11;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // 地图类型切换
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"普通", @"卫星", @"混合"]];
    segmentedControl.bounds = CGRectMake(0, 0, 200, 25);
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl addTarget:self
                         action:@selector(processSegmentedControl:)
               forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *segmentedItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:NULL];
    self.toolbarItems = @[flexibleItem, segmentedItem, flexibleItem];
    
    // 初始化MKMapView
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    // 配置委托对象
    _mapView.delegate = self;
    // 配置是否显示用户标注，默认为NO
    _mapView.showsUserLocation = YES;
    // 配置地图类型，默认标准类型
    _mapView.mapType = MKMapTypeStandard;
    [self.view addSubview:_mapView];
    
    // 初始化长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(processLongPressGesture:)];
    // 配置触发长按时间
    longPress.minimumPressDuration = 1;
    [self.view addGestureRecognizer:longPress];
}

- (void)updateAppearanceWithLocation:(CLLocation *)location
{
    
    if (!location) { return; }
    
    // 配置地图当前显示区域
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, span);
    [_mapView setRegion:region animated:YES];
    
    // 配置用户当前位置标注信息
    _mapView.userLocation.title = @"当前位置";
    _mapView.userLocation.subtitle = [NSString stringWithFormat:@"%.2f, %.2f", location.coordinate.latitude, location.coordinate.longitude];
}

- (void)reverseGeocodeLocation:(CLLocation *)location
                    completion:(void (^)(BOOL, id))completion
{
    
    if (!location) { return; }
    
    CLGeocoder *coder = [[CLGeocoder alloc] init];
    // 逆编码方法：后台线程执行
    [coder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        BOOL success;
        id content = nil;
        // 编码失败
        if (error) {
            success = NO;
            content = [error localizedDescription];
        }
        // 编码成功
        else {
            success = YES;
            // CLPlacemark
            CLPlacemark *placemark = [placemarks lastObject];
            content = placemark.addressDictionary;
        }
        if (completion) {
            completion(success, content);
        }
    }];
}

- (void)barButtonPressed:(UIBarButtonItem *)sender
{
    
    NSInteger index = sender.tag - 10;
    // 重定位
    if (index == 0) {
        [self showCurrentLocation];
    }
    // 当前位置详情
    else
    {
        [self showDetailInformationWithLocation:_locationManager.location];
    }
}

- (void)showCurrentLocation
{
    
    [_locationManager startUpdatingLocation];
}

- (void)showDetailInformationWithLocation:(CLLocation *)location
{
    
    if (!location) { return; }
    
    // 地理位置逆编码
    [self reverseGeocodeLocation:location completion:^(BOOL success, id content)
     {
         // 成功推送详情页面
         if (success)
         {
             NSLog(@"%@", content);
         }
         else {
             NSLog(@"%@", content);
         }
     }];
}

- (void)processSegmentedControl:(UISegmentedControl *)sender {
    
    _mapView.mapType = (MKMapType)sender.selectedSegmentIndex;
}

- (void)processLongPressGesture:(UILongPressGestureRecognizer *)sender {
    
    // 限定仅在手势触发时添加标注
    if (sender.state == UIGestureRecognizerStateBegan) {
        // 获取手势点击坐标
        CGPoint point = [sender locationInView:sender.view];
        // 视图坐标系转经纬度坐标系
        CLLocationCoordinate2D coordinate = [_mapView convertPoint:point toCoordinateFromView:_mapView];
        
        // 地理位置逆编码
        CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
        [self reverseGeocodeLocation:location completion:^(BOOL success, id content) {
            // 成功
            if (success) {
                // 添加标注数据源
                MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
                annotation.coordinate = coordinate;
                annotation.title = content[@"Name"];
                annotation.subtitle = [NSString stringWithFormat:@"%.2f, %.2f", coordinate.latitude, coordinate.longitude];
                [_mapView addAnnotation:annotation];
            }
            // 失败
            else {
                NSLog(@"%@", content);
            }
        }];
    }
}

#pragma mark - CLLocationManagerDelegate methods

// 定位成功
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    // NSLog(@"current location = %@", [locations lastObject]);
    NSLog(@"current location = %@", manager.location);
    // 停止定位
    [manager stopUpdatingLocation];
    // 更新地图显示
    [self updateAppearanceWithLocation:manager.location];
}

// 定位失败
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    NSLog(@"location service did failed with error message '%@'.", [error localizedDescription]);
    // 停止定位
    [manager stopUpdatingLocation];
}

#pragma mark - MKMapViewDelegate methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    // 用户标注情况
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    static NSString *viewIdentifier = @"AnnotationView";
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:viewIdentifier];
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:viewIdentifier];
        // 配置大头针颜色
        annotationView.pinColor = MKPinAnnotationColorPurple;
        // 配置是否需要动画
        annotationView.animatesDrop = YES;
        // 配置是否支持点击弹出框
        annotationView.canShowCallout = YES;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeInfoDark];
        button.bounds = CGRectMake(0, 0, 30, 30);
        annotationView.rightCalloutAccessoryView = button;
    }
    annotationView.annotation = annotation;
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    CLLocationCoordinate2D coordinate = [view.annotation coordinate];
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    // 详情展示
    [self reverseGeocodeLocation:location completion:^(BOOL success, id content) {
        NSLog(@"%@", content);
    }];
}

@end













