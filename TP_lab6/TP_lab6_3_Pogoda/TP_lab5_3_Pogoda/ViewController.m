//
//  ViewController.m
//  TP_lab5_3_Pogoda
//
//  Created by Admin on 14.04.17.
//  Copyright © 2017 Daniil Boyko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *indicator;
@property (weak, nonatomic) IBOutlet UITextField *fildcity;
@property (weak, nonatomic) IBOutlet UISegmentedControl *inputtype;
@property (nonatomic, retain) NSMutableData *textData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)refresh:(id)sender {
    NSURL *url;
    if ([[self inputtype] selectedSegmentIndex] == 0){
        NSString *city = [[self fildcity] text];
        url = [[NSURL alloc] initWithString: [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@&appid=2a3316ef209c91ac5c10a77e7717ac7b",city]];
    }
    else{
        NSArray *cordinats = [[[self fildcity] text] componentsSeparatedByString:@" "];
        url = [[NSURL alloc] initWithString: [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%@&lon=%@&appid=2a3316ef209c91ac5c10a77e7717ac7b",cordinats[0],cordinats[1]]];
    }
    //http://www.imaladec.com/story/downloading_data
    // создаем запрос //2 аргумент - это метод кэширования
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:url
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    NSURLConnection *theConnection = [NSURLConnection connectionWithRequest:theRequest delegate:self];
    if (theConnection) {
        self.textData = [NSMutableData data];
    } else {
        NSLog(@"Connection failed");
    }
    

}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.textData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary *forcasting = [NSJSONSerialization JSONObjectWithData: self.textData
                                                               options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *maidictionary = [forcasting valueForKey:@"main"];
    NSNumber *temperature = [maidictionary valueForKey:@"temp"];
    NSNumber *result = [NSNumber numberWithDouble:[temperature doubleValue] - 273.15];
    
    if ([result doubleValue] <= 0)
        [[self indicator] setTextColor:[UIColor blueColor]];
    if ([result doubleValue] >= 0 && [result doubleValue] < 10 )
        [[self indicator] setTextColor:[UIColor yellowColor]];
    if ([result doubleValue] >= 10 && [result doubleValue] < 20 )
        [[self indicator] setTextColor:[UIColor orangeColor]];
    if ([result doubleValue] >=20 && [result doubleValue] )
        [[self indicator] setTextColor:[UIColor redColor]];
    
    
    if ([result doubleValue] > 0)
        [[self indicator] setText: [NSString stringWithFormat:@"+%2.1f °C",[result doubleValue]]];
    else
        [[self indicator] setText: [NSString stringWithFormat:@"%2.1f °C",[result doubleValue]]];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

@end
