//
//  BLCMainMenuViewController.m
//  Alcolator
//
//  Created by Trevor Ahlert on 8/5/14.
//  Copyright (c) 2014 Trevor Ahlert. All rights reserved.
//

#import "BLCMainMenuViewController.h"
#import "BLCViewController.h"
#import "BLCWhiskeyViewController.h"


@interface BLCMainMenuViewController ()

@property (weak, nonatomic) UIButton *wine;
@property (weak, nonatomic) UIButton *whiskey;


@end

@implementation BLCMainMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void) loadView {
    self.view = [[UIView alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *whiskeyButton = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *wineButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.view addSubview:whiskeyButton];
    [self.view addSubview:wineButton];
    
    self.wine = wineButton;
    self.whiskey = whiskeyButton;
    self.navigationItem.title = @"Convert Beer Alcohol Content To:";
}

-(void) winePressed:(UIButton *) sender {
    BLCViewController *wineVC = [[BLCViewController alloc]init];
    [self.navigationController pushViewController:wineVC animated:YES];
}

-(void) whiskeyPressed: (UIButton *) sender {
    BLCViewController *whiskeyVC = [[BLCWhiskeyViewController alloc] init];
    [self.navigationController pushViewController:whiskeyVC animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.wine addTarget:self action:@selector(winePressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.wine setTitle:NSLocalizedString(@"Wine", @"Wine button") forState:UIControlStateNormal];
    [self.whiskey addTarget:self action:@selector(whiskeyPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.whiskey setTitle: NSLocalizedString(@"Whiskey", @"Whiskey button") forState:UIControlStateNormal];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    NSLog(@"Width:%.2f Height:%.2f", screenBounds.size.width, screenBounds.size.height);
    CGFloat viewWidth;
    
    if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        viewWidth = screenBounds.size.width;
    } else {
        viewWidth = screenBounds.size.height;
    }
    
   /* if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
    } else {
        
    }
   */
    CGFloat padding = 20;
    CGFloat itemWidth = viewWidth - padding - padding;
    CGFloat itemHeight = 44;
    self.wine.frame = CGRectMake(padding, padding + 100, itemWidth, itemHeight);
    self.whiskey.frame = CGRectMake (padding, padding + 150, itemWidth, itemHeight);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
