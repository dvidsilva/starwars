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
    [self setDefaults];
    
    
    
    if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ){
        
        //leemos la persistencia
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        NSDictionary *coords = [def objectForKey:LAST_SELECTED_CHARACTER];
        //obtenemos el ultimo
        int section = [[coords objectForKey:SECTION_KEY] intValue];
        int row = [[coords objectForKey:ROW_KEY] intValue];
        DVDCharacterModel *character = nil;
        DVDCharacterArray *model = [DVDCharacterArray new];
        
        if(section == IMPERIAL_SECTION){
            character = [model imperialCharacterAtIndex:row];
        }else{
            character = [model rebelCharacterAtIndex:row];
        }
        
        //creamos el controlador de tabla//
        DVDCharactersViewController *charsVC = [[DVDCharactersViewController alloc]
                                                initWithStyle:UITableViewStylePlain
                                                model:model];
        
        //pantalla de ipad
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
        charsVC.delegate = charVC;
        
        //mostramos en pantalla
        self.window.rootViewController = splitVC;
        
    }else{
        //pantalla de iphone/ipod
        
        //creamos modelo
        DVDCharacterArray *model = [[DVDCharacterArray alloc] init];
        //controlador de tabla
        DVDCharactersViewController *charsVC = [[DVDCharactersViewController alloc]
                                               initWithStyle:UITableViewStylePlain
                                                        model:model];
        
        //combinador
        UINavigationController *charsNav = [[UINavigationController alloc] init];
        [charsNav pushViewController:charsVC animated:NO];
        
        //asignamos delegados
        charsVC.delegate = charsVC;
        
        //mostrar
        self.window.rootViewController = charsNav;
    }

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

-(void)setDefaults {
    NSUserDefaults *defaults =  [NSUserDefaults standardUserDefaults];
    
    if ( [ defaults objectForKey:LAST_SELECTED_CHARACTER] == nil){
        
        //la aplicación no habia sido llamada antes, guardamos un valor por defecto
        NSDictionary *coords = @{SECTION_KEY: @(IMPERIAL_SECTION), ROW_KEY:@0 };
        // @() transformar de 'numero' a NSNumber type, cast
        [ defaults setObject:coords
                      forKey:LAST_SELECTED_CHARACTER];
        [defaults synchronize];
        
    }else{
        
        
        
    }
}


@end
