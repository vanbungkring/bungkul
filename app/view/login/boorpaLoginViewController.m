//
//  boorpaLoginViewController.m
//  Boorpa
//
//  Created by Arie Prasetyo on 4/28/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import "boorpaLoginViewController.h"

@interface boorpaLoginViewController ()

@end

@implementation boorpaLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.view.backgroundColor = [UIColor whiteColor];
		self.title = @"Login";
		
		self.view.backgroundColor = [UIColor colorWithRed:0.941 green:0.941 blue:0.941 alpha:1];
		
		scrollview  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
		
		wrapper = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 504)];
		wrapper.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"register-login-form"]];
		
		///texfield here
		userName = [[UITextField alloc]initWithFrame:CGRectMake(72, 220, 176, 36)];
		userName.backgroundColor = [UIColor whiteColor];
		userName.placeholder = @"Username";
		userName.delegate = self;
		userName.tag=1;
		userName.layer.borderWidth = 0.8;
		userName.returnKeyType = UIReturnKeyNext;
		userName.layer.borderColor = [UIColor colorWithRed:0.925 green:0.925 blue:0.925 alpha:1].CGColor;
		userName.font = [UIFont fontWithName:@"HeleticaNeue Bold" size:14];
		userName.layer.cornerRadius =5;
		userName.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
		
		password = [[UITextField alloc]initWithFrame:CGRectMake(72, 270, 176, 36)];
		password.backgroundColor = [UIColor whiteColor];
		password.tag =2;
		password.secureTextEntry = YES;
		password.placeholder = @"password";
		password.layer.borderWidth = 0.8;
		password.delegate = self;
		password.returnKeyType = UIReturnKeyNext;
		password.layer.borderColor = [UIColor colorWithRed:0.925 green:0.925 blue:0.925 alpha:1].CGColor;
		password.font = [UIFont fontWithName:@"HeleticaNeue Bold" size:14];
		password.layer.cornerRadius =5;
		password.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0);
		
		login_button = [[UIButton alloc]initWithFrame:CGRectMake(72, 330, 176, 44.5)];
		[login_button setBackgroundImage:[UIImage imageNamed:@"login-button"] forState:UIControlStateNormal];
		[login_button addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
		
		terms = [[UILabel alloc]initWithFrame:CGRectMake(20, 400, 280, 55)];
		terms.text = @"By signing in, I accept BLINC*’s Terms of Service and Privacy Policy";
		terms.numberOfLines = 2;
		terms.textAlignment = NSTextAlignmentCenter;
		terms.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
		terms.textColor = [UIColor colorWithRed:0.769 green:0.769 blue:0.769 alpha:1];
		
		[wrapper addSubview:login_button];
		//[wrapper addSubview:terms];
		[wrapper addSubview:userName];
		[wrapper addSubview:password];
		[scrollview addSubview:wrapper];
		[self.view addSubview:scrollview];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
	[close setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
	UIEdgeInsets buttonEdges = UIEdgeInsetsMake(0, 0, 0, 0);
	[close setImageEdgeInsets:buttonEdges];
	[close addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
	[close setFrame:CGRectMake(0, 0, 40, 40)];
	[[self navigationItem] setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:close]];
    // Do any additional setup after loading the view.
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
	if(textField.tag==1){
		NSLog(@"1");
		[scrollview setContentOffset:CGPointMake(0,70) animated:YES];
		[scrollview setUserInteractionEnabled:NO];
	}
	else if (textField.tag==2){
		NSLog(@"2");
		[scrollview setContentOffset:CGPointMake(0,140) animated:YES];
		[scrollview setUserInteractionEnabled:NO];
	}
	else{
		[textField resignFirstResponder];
	}
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
	
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField.tag==1){
		[userName resignFirstResponder];
		[password becomeFirstResponder];
		[scrollview setContentOffset:CGPointMake(0,140) animated:YES];
		[scrollview setUserInteractionEnabled:NO];
	}
	else{
		[textField resignFirstResponder];
		[scrollview setContentOffset:CGPointMake(0,0) animated:YES];
		[scrollview setUserInteractionEnabled:YES];
	}
	
	return YES;
}
-(void)signUp{
	if(userName.text.length<=0 || password.text.length<=0 ){
		//[orc showAlert:@"Error" message:@"Harap isi data secara lengkap"];
	}
	else{
		//[blincBrain signIntoServer:@{@"username":userName.text,@"password":password.text}];
		
		[boorpa signIntoServer:@{@"username":userName.text,@"password":password.text}];
	}
}
-(void)close:(id)sender{
	[self.navigationController dismissViewControllerAnimated:YES completion:Nil];
}
-(void)viewWillAppear:(BOOL)animated{
	
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
