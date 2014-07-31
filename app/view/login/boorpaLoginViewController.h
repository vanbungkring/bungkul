//
//  boorpaLoginViewController.h
//  Boorpa
//
//  Created by Arie Prasetyo on 4/28/14.
//  Copyright (c) 2014 Boorpa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface boorpaLoginViewController :  UIViewController<UITextFieldDelegate>
{
	UIView *wrapper;
	UIScrollView *scrollview;
	UITextField *userName;
	UITextField *password;
	UIButton *login_button;
	UILabel *terms;
}


@end
