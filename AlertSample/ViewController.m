//
//  ViewController.m
//  AlertSample
//
//  Created by appledeveloper on 09/04/19.
//  Copyright © 2019 Senthilkumar K. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+animatedGIF.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clickmeAction:(id)sender {
    
    
    [self showMyAlert:@"Sample Loader" Message:@"Please wait....."  Loader:YES];
    
}


- (void)showMyAlert:(NSString*)title Message:(NSString*)msg Loader:(BOOL)status {
    
    NSString * titleStr = [NSString stringWithFormat:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n %@",title];
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle : titleStr
                                                                    message : msg
                                                             preferredStyle : UIAlertControllerStyleAlert];
    
    if (status == YES) {
        
    UIView *loaderView = [[UIView alloc] initWithFrame:CGRectMake(510, 20, 70, 70)];
    [alert.view addSubview:loaderView];

    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70,70)];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"loader" ofType:@"gif"];
    NSURL *url=[[NSURL alloc] initFileURLWithPath:path];
    imgView.image= [UIImage animatedImageWithAnimatedGIFURL:url];
    [loaderView addSubview:imgView];
        
    }
    
    UIAlertAction * ok = [UIAlertAction
                          actionWithTitle:@"OK"
                          style:UIAlertActionStyleDefault
                          handler:^(UIAlertAction * action)
                          { }];
    
    [alert addAction:ok];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
    
    
}


@end
