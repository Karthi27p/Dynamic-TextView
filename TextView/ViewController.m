//
//  ViewController.m
//  TextView
//
//  Created by Karthi on 20/11/17.
//  Copyright © 2017 Tringapps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

   NSString *truncatedString = [self stringByTruncatingToWidth:self.view.frame.size.width*2 withFont:[UIFont systemFontOfSize:13]];
    //[self.label setTextAlignment:NSTextAlignmentJustified];
    [self.label setText:truncatedString];
    [_textView setText:truncatedString];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*)stringByTruncatingToWidth:(CGFloat)width withFont:(UIFont *)font
{
    /*CGSize constraintRect = CGSizeMake(width-40, CGFLOAT_MAX);
     CGSize boundingBox = [self boundingRectWithSize:constraintRect options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arimo" size:13]} context:NSLineBreakByWordWrapping].size;
     NSLog(@"bounding%f", boundingBox.width);*/
    // Create copy that will be the returned result
    NSString *labelText = @"David bipsel performs Eiss Alma AL aire at the latin successfully person of the year tribute hohnoring";
    NSMutableString *truncatedString = [labelText mutableCopy];
    /* width -= 91;
     NSLog(@"truncatedString%f,width%f",[truncatedString sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arimo" size:13]}].width,width);*/
    // Make sure string is longer than requested width
    if ([truncatedString sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial" size:13]}].width > width)
    {
        // Accommodate for ellipsis we'll tack on the end
        width -= 91;//[ellipsis sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial" size:15]}].width;
        
        // Get range for last character in string
        NSRange range = {truncatedString.length - 1, 1};
        
        // Loop, deleting characters until string fits within width
        while ([truncatedString sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arial" size:13]}].width > width)
        {
            //NSLog(@"truncatedString%f,width%f",[truncatedString sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Arimo" size:13]}].width,width);
            // Delete character at end
            [truncatedString deleteCharactersInRange:range];
            
            // Move back another character
            range.location--;
        }
        
        // Append ellipsis
        //[truncatedString replaceCharactersInRange:range withString:ellipsis];
    }
    
    return truncatedString;
}

@end
