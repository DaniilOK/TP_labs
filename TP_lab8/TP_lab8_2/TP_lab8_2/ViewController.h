//
//  ViewController.h
//  TP_lab8_2
//
//  Created by Admin on 26.05.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *loginRegistry;
@property (weak, nonatomic) IBOutlet UITextField *emailRegistry;
@property (weak, nonatomic) IBOutlet UITextField *passwordRegistry;
@property (weak, nonatomic) IBOutlet UITextField *retryPasswordRegistry;
@property (weak, nonatomic) IBOutlet UIButton *registry;
@property (weak, nonatomic) IBOutlet UIView *logInView;
@property (weak, nonatomic) IBOutlet UITextField *loginEntry;
@property (weak, nonatomic) IBOutlet UITextField *passwordEntry;
@property (weak, nonatomic) IBOutlet UILabel *errorMessage;


@end

