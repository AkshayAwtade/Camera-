//
//  ViewController.m
//  ASACamera
//
//  Created by Student P_03 on 08/08/16.
//  Copyright © 2016 Akshay Awtade. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.butonSMS.enabled=NO;
    self.Buttonmail.enabled=NO;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)butonSMSTapped:(id)sender {
    MFMessageComposeViewController *smsView =[[MFMessageComposeViewController alloc]init];
    NSArray * number=@"8308011436";
    [smsView setRecipients:number];
    smsView.delegate=self;
    smsView.messageComposeDelegate=self;
    [self presentViewController:smsView animated:YES completion:nil];
    
}




- (IBAction)ButtoncaptureImageTapped:(id)sender {
    UIImagePickerController *camera = [[UIImagePickerController alloc]init];
    camera.delegate=sender;
    [camera setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:camera animated:YES completion:nil];
}



- (IBAction)buttonMailTapped:(id)sender {
    MFMailComposeViewController *mail =[[MFMailComposeViewController alloc]init];
    
       mail.mailComposeDelegate=self;  
    mail.delegate=self;

    if (self.image.image) {
        
        UIImage *imageToMail = self.image.image;
        
        NSData *imageData = UIImagePNGRepresentation(imageToMail);
        
        [mail addAttachmentData:imageData mimeType:@"image/png" fileName:@"ImageDemo.png"];
        
    }
    
//   NSArray *recepient =[[NSArray alloc]initWithObjects:@[@"akshayawtade.123@gmail.com"], nil];
//    NSArray *body =@[@"body here"];
//    NSArray *subject=@[@"Demo Email"];
//    [mail setToRecipients:@[@"akshayawtade.123@gmail.com"]];
    [mail setMessageBody:@"hii" isHTML:NO];
    [mail setSubject:@"Demo mail"];
    
    [self presentViewController:mail animated:YES completion:nil];
    
       }





- (IBAction)buttonSelectPhotoTapped:(id)sender {
    UIImagePickerController * capturedImage =[[UIImagePickerController alloc]init];
    capturedImage.delegate=self;
    [self presentViewController:capturedImage animated:YES completion:nil];
        }



-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"%@",info);
    UIImage *selectedImage =[info valueForKey:@"UIImagePickerControllerOriginalImage"];
    self.image.image=selectedImage;
    [self dismissViewControllerAnimated:YES completion:nil];
    if(self.image)
    {
        NSLog(@"%@selected image",self.image);
        self.Buttonmail.enabled=YES;
    }

}




-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];

}




-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    if(error)
    {
        NSLog(@"%@",error.localizedDescription);
        
    }
    else
    {
        switch (result) {
            case MFMailComposeResultSent:
            {
                NSLog(@"sent");
                break;
            
            }
            case MFMailComposeResultSaved:
                
            {
                NSLog(@"saved");
                break;
            }
            case MFMailComposeResultFailed:
            {
                NSLog(@"failed");
                break;
            }
            case MFMailComposeResultCancelled:
            {
                NSLog(@"cancelled");
                break;
            }
                
            default:
                break;
        }
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}





-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultFailed:
        {
            NSLog(@"failed");
            break;
        }
        case MessageComposeResultSent:
        {
            NSLog(@"Sent");
            break;
        }
            case MessageComposeResultCancelled:
        {
            NSLog(@"Cancelled");
            break;
        }
            
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
