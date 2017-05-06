//
//  ViewController.m
//  TP_lab7_1
//
//  Created by Admin on 20.04.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *canvas;
@property CGPoint lastPoint;
@property (weak, nonatomic) IBOutlet UITextField *fieldRed;
@property (weak, nonatomic) IBOutlet UITextField *fieldGreen;
@property (weak, nonatomic) IBOutlet UITextField *fieldBlue;
@property (weak, nonatomic) IBOutlet UITextField *fieldWidth;
@property (weak, nonatomic) IBOutlet UITextField *fileField;

@property float Red,Green,Blue;

@end

@implementation ViewController


- (IBAction)setSettings:(id)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)savePicture:(id)sender {
    UIImageWriteToSavedPhotosAlbum( _canvas.image,  nil, nil, nil);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    [self setLastPoint:[touch locationInView:self.canvas]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint currentPoint = [touch locationInView:self.canvas];
    
    UIGraphicsBeginImageContext(self.canvas.frame.size);
    
    CGRect drawRect = CGRectMake(0.0f, 0.0f, self.canvas.frame.size.width,
                                 
                                 self.canvas.frame.size.height);
    
    [[[self canvas] image] drawInRect:drawRect];
    
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), [[self.fieldWidth text] floatValue]);
    
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), [[self.fieldRed text] floatValue] /256, [[self.fieldGreen text] floatValue]/256, [[self.fieldBlue text] floatValue]/256, 1.0f);
    
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x,
                         
                         _lastPoint.y);
    
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x,
                            
                            currentPoint.y);
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    [[self canvas] setImage:UIGraphicsGetImageFromCurrentImageContext()];
    
    UIGraphicsEndImageContext();
    
    _lastPoint = currentPoint;
}

@end
