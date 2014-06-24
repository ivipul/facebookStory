//
//  MainViewController.m
//  facebookStory
//
//  Created by Vipul Thakur on 6/23/14.
//  Copyright (c) 2014 ivipul. All rights reserved.
//

#import "MainViewController.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>
#import <QuartzCore/QuartzCore.h>

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *actionBox;
@property (weak, nonatomic) IBOutlet UIView *parentView;
@property (weak, nonatomic) IBOutlet UIView *messageHolder;
@property (weak, nonatomic) IBOutlet UIImageView *imageHolder;
@property (weak, nonatomic) IBOutlet UIImageView *commentBox;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;
- (IBAction)likeButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *likeBtnOutlet;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.actionBox.layer.borderColor= [UIColor colorWithRed:(243/255.0) green:(243/255.0) blue:(243/255.0) alpha:1].CGColor;
    self.actionBox.layer.borderWidth= 1.0f;
    
    self.commentBox.layer.borderColor= [UIColor colorWithRed:(243/255.0) green:(243/255.0) blue:(243/255.0) alpha:1].CGColor;
    self.commentBox.layer.borderWidth= 1.0f;
    
    self.messageHolder.layer.cornerRadius = 2;
    self.messageHolder.layer.shadowColor = [UIColor blackColor].CGColor;
    self.messageHolder.layer.shadowOffset = CGSizeMake(0, 0);
    self.messageHolder.layer.shadowOpacity = 0.2;
    self.messageHolder.layer.shadowRadius = 1;
    
    self.imageHolder.layer.shadowColor = [UIColor blackColor].CGColor;
    self.imageHolder.layer.shadowOffset = CGSizeMake(0, 0);
    self.imageHolder.layer.shadowOpacity = 0.2;
    self.imageHolder.layer.shadowRadius = 2;
    
    UIImage *fieldBGImage = [UIImage imageNamed:@"textfieldBackground@2x.png"];
    self.commentTextField.background=fieldBGImage;
    
    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(10, 20, 280, 150)];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    //label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    
    NSString *text = @"From colarless shirts to high-wasted pants, #Her's costume designer, Caset Storm, explains how he created his fashion looks for the future: http://bit.ly/1jV9zM8";
    
    label.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
    label.delegate = self; // Delegate methods are called when the user taps on a link (see `TTTAttributedLabelDelegate` protocol)
    
    label.text = @"Fork me on GitHub! (http://github.com/mattt/TTTAttributedLabel/)"; // Repository URL will be automatically detected and linked
    
    NSRange range = [label.text rangeOfString:@"me"];
    [label addLinkToURL:[NSURL URLWithString:@"http://github.com/mattt/"] withRange:range]; // Embedding a custom link in a substring
    
    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"#Her" options:NSCaseInsensitiveSearch];
        //NSRange strikeRange = [[mutableAttributedString string] rangeOfString:@"sit amet" options:NSCaseInsensitiveSearch];
        
        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:14];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
            //[mutableAttributedString addAttribute:kTTTStrikeOutAttributeName value:[NSNumber numberWithBool:YES] range:strikeRange];
            CFRelease(font);
        }
        
        return mutableAttributedString;
    }];
    [self.parentView addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)likeButton:(id)sender {
    NSLog(@"clicking like button");
    [sender setSelected:YES];
}


@end
