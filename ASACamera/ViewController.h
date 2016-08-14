//
//  ViewController.h
//  ASACamera
//
//  Created by Student P_03 on 08/08/16.
//  Copyright © 2016 Akshay Awtade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface ViewController : UIViewController <UIImagePickerControllerDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *butonSMS;
@property (weak, nonatomic) IBOutlet UIImageView *image;
- (IBAction)butonSMSTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *Buttonmail;

- (IBAction)ButtoncaptureImageTapped:(id)sender;
- (IBAction)buttonMailTapped:(id)sender;

- (IBAction)buttonSelectPhotoTapped:(id)sender;

@end

