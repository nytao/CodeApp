//
//  ViewController.h
//  CodeApp
//
//  Created by William on 7/14/15.
//  Copyright (c) 2015 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    UITextField *txtField;
    UIButton *goBtn;
    UISegmentedControl *segControl;
    UISlider *mySlider;
    UIStepper *myStepper;
    UISwitch *mySwitch;
    UIWebView *myWebView;
    
}

- (void) goClicked;
- (void) segControlChange;
- (void) loadWebPage: (NSString *) url;
- (void) sliderChange;
- (void) stepperChange;
- (void) switchChange;


@end

