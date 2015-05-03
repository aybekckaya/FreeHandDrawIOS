//
//  ViewController.h
//  FreeHand
//
//  Created by aybek can kaya on 5/3/15.
//  Copyright (c) 2015 aybek can kaya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeHandView.h"
#import "ImageVC.h"

@interface ViewController : UIViewController<FreeHandViewDelegate>
{
    
}

@property (weak, nonatomic) IBOutlet FreeHandView *viewFreeHand;

- (IBAction)deleteOnTap:(id)sender;


@end

