//
//  FreeHandView.m
//  mobilSatis
//
//  Created by aybek can kaya on 17/07/14.
//  Copyright (c) 2014 aybek can kaya. All rights reserved.
//

#import "FreeHandView.h"






@implementation UIView(Extended)


- (UIImage *) imageByRenderingView
{
    CGFloat oldAlpha = self.alpha;
    self.alpha = 1;
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.alpha = oldAlpha;
    return resultingImage;
}

@end


@implementation FreeHandView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setMultipleTouchEnabled:NO];
        path = [UIBezierPath bezierPath];
        
        // defaults
        [path setLineWidth:2.0];
        [[UIColor blackColor] setStroke];
        
        self.colorStroke =[UIColor blackColor];
        self.lineWidth = 2;
        
    }
    return self;
}

-(void)awakeFromNib
{
  //  path = [UIBezierPath bezierPath];
   // [path setLineWidth:2.0];

    
}


- (void)drawRect:(CGRect)rect
{
    [self.colorStroke setStroke];
    [path setLineWidth:self.lineWidth];
    
    [path stroke];
}


-(void)deleteDrawing
{
    path = [UIBezierPath bezierPath];
    
    [path setLineWidth:self.lineWidth];
    [self.colorStroke setStroke];
    
    [path stroke];
      [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    
              [path moveToPoint:p];
        
        if([self.delegate respondsToSelector:@selector(freeHandView:didStartDrawingAtPoint:)])
        {
            [self.delegate freeHandView:self didStartDrawingAtPoint:p];
        }
    
  
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    
   
        [path addLineToPoint:p];
        [self setNeedsDisplay];
        
        if([self.delegate respondsToSelector:@selector(freeHandView:drawnAtPoint:)])
        {
            [self.delegate freeHandView:self drawnAtPoint:p];
        }
        
    
   
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
       UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    
   
             [self touchesMoved:touches withEvent:event];
        
        if([self.delegate respondsToSelector:@selector(freeHandView:didEndDrawingAtPoint:)])
        {
            [self.delegate freeHandView:self didEndDrawingAtPoint:p];
        }
        
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}


-(UIImage *)imageRepresentation
{
    UIImage *img = [self imageByRenderingView];
    return img;
}

@end
