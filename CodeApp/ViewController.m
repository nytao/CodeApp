//
//  ViewController.m
//  CodeApp
//
//  Created by William on 7/14/15.
//  Copyright (c) 2015 William. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) goClicked{
    
    [self loadWebPage:txtField.text];
    
}

- (void) loadWebPage: (NSString *)url{
    
    [myWebView loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString: url]]];
    
}

- (void) segControlChange{
    
    switch (segControl.selectedSegmentIndex) {
//            [segControl setSelectedSegmentIndex:-1];
        case 0:
            [myWebView goBack];
            break;
        
        case 1:
            [myWebView reload];
            break;
            
        case 2:
            [self loadWebPage:@""];
            break;
            
        case 3:
            [myWebView goForward];
            break;
            
        default:
            break;
    }
    [segControl setSelectedSegmentIndex:-1];
    
}

- (void) sliderChange{
    
    if (mySlider.value < 0.5f) {
        [self loadWebPage:@"http://www.citibank.com"];
        myStepper.value = 0.0f;
    } else if (mySlider.value < 1.5f){
        [self loadWebPage:@"http://www.chase.com"];
        myStepper.value = 1.0f;
    } else if (mySlider.value < 2.5f){
        [self loadWebPage:@"http://www.bankofamerica.com"];
        myStepper.value = 2.0f;
    } else if (mySlider.value < 3.5f){
        [self loadWebPage:@"http://www.wellsfargo.com"];
        myStepper.value = 3.0f;
    } else {
        [self loadWebPage:@"http://www.pnc.com"];
        myStepper.value = 4.0f;
    }
    
}

- (void) stepperChange{
    
    mySlider.value = myStepper.value;
    switch ((int)myStepper.value) {
        case 0:
        [self loadWebPage:@"http://www.citibank.com"];
            break;
        
        case 1:
            [self loadWebPage:@"http://www.chase.com"];
            break;
            
        case 2:
        [self loadWebPage:@"http://www.bankofamerica.com"];
            break;
            
        case 3:
        [self loadWebPage:@"http://www.wellsfargo.com"];
            break;
            
        case 4:
        [self loadWebPage:@"http://www.pnc.com"];
            break;
            
        default:
            break;
    }
    
}

- (void) switchChange{
    
    if (mySwitch.on) {
        txtField.userInteractionEnabled = YES;
    } else {
        txtField.userInteractionEnabled = NO;
        txtField.text = @"";
        [self loadWebPage:@""];
    }
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    txtField = [[UITextField alloc] initWithFrame: CGRectMake(20, 60, self.view.frame.size.width - 120, 30)];
    txtField.borderStyle = UITextBorderStyleRoundedRect;
    txtField.placeholder = @"Enter URL";
    [self.view addSubview:txtField];
    
    goBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goBtn.frame = CGRectMake(self.view.frame.size.width - 80, 60, 60, 30);
    [goBtn setTitle:@"GO" forState: UIControlStateNormal];
    [goBtn setTitle:@"Stop" forState: UIControlStateDisabled];
    [goBtn addTarget:self action:@selector(goClicked) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview:goBtn];
    
    NSArray *myArray = @[@"Back", @"Reload", @"Clear", @"Forward"];
    segControl = [[UISegmentedControl alloc] initWithItems:myArray];
    segControl.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 30);
    [segControl addTarget:self action:@selector(segControlChange) forControlEvents: UIControlEventValueChanged];
    [self.view addSubview:segControl];
    
    mySlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 140, self.view.frame.size.width - 40, 30)];
    mySlider.maximumValue = 5;
    [mySlider addTarget:self action:@selector(sliderChange) forControlEvents: UIControlEventValueChanged];
    [self.view addSubview:mySlider];
    
    myStepper = [[UIStepper alloc] initWithFrame:CGRectMake(20, 180, 0, 30)];
    myStepper.maximumValue = 5;
    myStepper.stepValue = 1.0f;
    [myStepper addTarget:self action:@selector(stepperChange) forControlEvents: UIControlEventValueChanged];
    [self.view addSubview:myStepper];
    
    mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 80, 180, 0, 30)];
    mySwitch.on = YES;
    [mySwitch addTarget:self action:@selector(switchChange) forControlEvents: UIControlEventValueChanged];
    [self.view addSubview:mySwitch];
    
    myWebView = [[UIWebView alloc] initWithFrame:
                 CGRectMake(20, 220, self.view.frame.size.width - 40, self.view.frame.size.height - 240)];
    [self.view addSubview:myWebView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
