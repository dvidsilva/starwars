//
//  DVDAppDelegate.m
//  StarWars
//
//  Created by Dvid Silva on 5/6/13.
//  Copyright (c) 2013 Dvid Silva. All rights reserved.
//

#import "DVDAppDelegate.h"
#import "DVDCharacterModel.h"
#import "DVDCharacterViewController.h"
#import "DVDWikiViewController.h"
#import "DVDCharacterArray.h"
#import "DVDCharactersViewController.h"

@implementation DVDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
    [self configureAppeareance];

    
    //creamos el modelo
    DVDCharacterArray *model = [DVDCharacterArray new];
    
    //creamos el controlador de tabla//
    DVDCharactersViewController *charsVC = [[DVDCharactersViewController alloc]
                                            initWithStyle:UITableViewStylePlain
                                                    model:model];
    //creamos un controlador de personaje //
    DVDCharacterViewController *charVC = [[DVDCharacterViewController alloc] initWithModel:[model imperialCharacterAtIndex:0]];
    
    //creamos los navigations
    UINavigationController *tableNav = [[UINavigationController alloc] init];
    [tableNav pushViewController:charsVC animated:NO];
    
    UINavigationController *charNav = [[UINavigationController alloc]init];
    [charNav pushViewController:charVC animated:NO];
    
    
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[tableNav, charNav];
    splitVC.title = @"StarWars Encyclopedia";
    
    //asignamos delegados
    splitVC.delegate = charVC;

    //mostramos en pantalla
    self.window.rootViewController = splitVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - utility methods
-(void) configureAppeareance {
    UIColor *darkblue = [UIColor colorWithRed:0
                                        green:0 blue:0.15
                                        alpha:1];
    UIColor *darkerblue = [UIColor colorWithRed:0
                                        green:0 blue:0.04
                                        alpha:1];
    
    [[UINavigationBar appearance] setTintColor:darkblue];
    
    [[UIToolbar appearance] setTintColor:darkblue];
    
    [[UITableViewHeaderFooterView appearance] setTintColor:darkerblue];
}


@end
