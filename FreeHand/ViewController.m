//
//  ViewController.m
//  FreeHand
//
//  Created by aybek can kaya on 5/3/15.
//  Copyright (c) 2015 aybek can kaya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.viewFreeHand.delegate =self;
  
    self.viewFreeHand.colorStroke = [UIColor greenColor];
    self.viewFreeHand.lineWidth = 4;
    
}


#pragma mark FreeHandView  delegates 




-(void)freeHandView:(FreeHandView *)viewFreeHand didStartDrawingAtPoint:(CGPoint)point
{
    
}

-(void) freeHandView:(FreeHandView *)viewFreeHand drawnAtPoint:(CGPoint)point
{
    NSLog(@"Free Hand View has drawn at point : %@" , NSStringFromCGPoint(point));
}


-(void)freeHandView:(FreeHandView *)viewFreeHand didEndDrawingAtPoint:(CGPoint)point
{
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue identifieer : %@" , [segue identifier]);
    if([[segue identifier] isEqualToString:@"imageVC"])
    {
        UIImage *img = [self.viewFreeHand imageRepresentation];
        ImageVC *vc = (ImageVC *)[segue destinationViewController];
        vc.image = img;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deleteOnTap:(id)sender
{
    [self.viewFreeHand deleteDrawing];
}
@end
