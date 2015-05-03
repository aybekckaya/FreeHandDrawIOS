//
//  FreeHandView.h
//  mobilSatis
//
//  Created by aybek can kaya on 17/07/14.
//  Copyright (c) 2014 aybek can kaya. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 Data sources : 
 
 optional:
 shouldDrawAtPoint
 color at point 
 line width at point
 
 
 Delegates :
 
 
 drawStart , drawAtLocation , drawEndAtLocation
 
 
 */

@class FreeHandView;




@protocol FreeHandViewDelegate <NSObject>

@optional
-(void)freeHandView:(FreeHandView *)viewFreeHand didStartDrawingAtPoint:(CGPoint) point;

-(void)freeHandView:(FreeHandView *)viewFreeHand drawnAtPoint:(CGPoint)point;

-(void)freeHandView:(FreeHandView *)viewFreeHand didEndDrawingAtPoint:(CGPoint)point;

@end


@interface FreeHandView : UIView
{
    UIBezierPath *path;
}


@property(nonatomic,weak) id<FreeHandViewDelegate> delegate;


@property(nonatomic,strong) UIColor *colorStroke;
@property(nonatomic) float lineWidth;



-(void)deleteDrawing;

-(UIImage *)imageRepresentation;

@end



@interface UIView(Extended)

- (UIImage *) imageByRenderingView;

@end

