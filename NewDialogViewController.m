//
//  Created by manul on 31.01.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NewDialogViewController.h"
#import "EnglishDialogsToolsAppDelegate.h"


@implementation NewDialogViewController

- (void)ok:(id)sender {
    
    [NSApp endSheet:_newDialogWindow returnCode:NSOKButton];
}

- (void)cancel:(id)sender {
    [NSApp endSheet:_newDialogWindow returnCode:NSCancelButton];
}

- (NSWindow *)newDialogWindow {
    return _newDialogWindow;

}


- (void)dealloc {
    [_newDialogWindow release];
    [super dealloc];
}

@end