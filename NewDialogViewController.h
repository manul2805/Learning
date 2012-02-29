//
//  Created by manul on 31.01.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface NewDialogViewController : NSObject {
    IBOutlet NSWindow * _newDialogWindow;

}
- (IBAction) ok:(id) sender;
- (IBAction) cancel:(id) sender;
- (NSWindow *)newDialogWindow;

@end