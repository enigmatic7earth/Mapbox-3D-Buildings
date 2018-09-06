//
//  ViewController.m
//  Mapbox-3D buildings
//
//  Created by NETBIZ on 25/04/18.
//  Copyright © 2018 Netbiz.in. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UISegmentedControl *mapSwitchControl;
@property (strong, nonatomic) MGLMapView * mapboxMapView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"mapbox://styles/mapbox/streets-v10"];
    _mapboxMapView = [[MGLMapView alloc] initWithFrame:self.view.bounds styleURL:url];
    _mapboxMapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [_mapboxMapView setCenterCoordinate:CLLocationCoordinate2DMake(20.5937, 78.9629)
//                       zoomLevel:9
//                        animated:YES];
    _mapboxMapView.delegate = self;
    
    // Declare the marker and set its coordinates, title, and subtitle.
    MGLPointAnnotation *hello = [[MGLPointAnnotation alloc] init];
    hello.coordinate = CLLocationCoordinate2DMake(19.0760, 72.8777);
    hello.title = @"Mumbai";
    hello.subtitle = @"Maharashtra";
    
    // Add marker to the map
    [_mapboxMapView addAnnotation:hello];
    [self.view addSubview:_mapboxMapView];
    [self.view bringSubviewToFront:_mapSwitchControl];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Use the default marker. See also: our view annotation or custom marker examples.
- (MGLAnnotationImage *)mapView:(MGLMapView *)mapView viewForAnnotation:(id <MGLAnnotation>)annotation {
    return nil;
}

// Allow callout view to appear when an annotation is tapped.
- (BOOL)mapView:(MGLMapView *)mapView annotationCanShowCallout:(id <MGLAnnotation>)annotation {
    return YES;
}

- (IBAction)changeMapStyle:(UISegmentedControl *)sender {
    switch ([sender selectedSegmentIndex]) {
        case 0:
            [_mapboxMapView setStyleURL:[NSURL URLWithString:@"mapbox://styles/mapbox/streets-v10"]];
            break;
        case 1:
            [_mapboxMapView setStyleURL:[NSURL URLWithString:@"mapbox://styles/prashants/cjgetks8l001p2spk4pzjsxyv"]];
            break;
            
        default:
            break;
    }
}


@end
