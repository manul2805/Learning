//
//  main.m
//  EnglishDialogsTools
//
//  Created by Павел Ковардыков on 26.01.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <CoreData/CoreData.h>
#import <objc/objc-auto.h>

/*
 NSManagedObjectModel* managedObjectModel(){
	static NSManagedObjectModel* mom;
	if (mom!=nil) return mom;
	mom=[[NSManagedObjectModel alloc] init];
	return mom;
}
// */

int main(int argc, char *argv[])
{
	//objc_startCollectorThread();
    return NSApplicationMain(argc,  (const char **) argv);
}
