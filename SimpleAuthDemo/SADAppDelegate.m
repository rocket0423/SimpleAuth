//
//  SADAppDelegate.m
//  SimpleAuthDemo
//
//  Created by Caleb Davenport on 1/16/14.
//  Copyright (c) 2014 Byliner, Inc. All rights reserved.
//

#import "SADAppDelegate.h"
#import "SADProviderListViewController.h"

#import "SimpleAuth.h"

@implementation SADAppDelegate

@synthesize window = _window;

#pragma mark - Accessors

- (UIWindow *)window {
    if (!_window) {
        UIScreen *screen = [UIScreen mainScreen];
        
        _window = [UIWindow new];
        _window.screen = screen;
        _window.frame = screen.bounds;
        
        SADProviderListViewController *providers = [SADProviderListViewController new];
        UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:providers];
        _window.rootViewController = navigation;
    }
    return _window;
}


- (void)setWindow:(UIWindow *)window {
    // Do nothing
}


#pragma mark - Private

- (void)configureAuthorizaionProviders {
    
    // consumer_key and consumer_secret are required
    SimpleAuth.configuration[@"twitter"] = @{};
    SimpleAuth.configuration[@"twitter-web"] = @{};
    
    // client_id and redirect_uri are required
    SimpleAuth.configuration[@"instagram"] = @{};
    
    // app_id is required
    SimpleAuth.configuration[@"facebook"] = @{};
    // app_secret optional required for re-authorization of token
    SimpleAuth.configuration[@"facebook-web"] = @{};
	
    // client_id and redirect_uri are required
    SimpleAuth.configuration[@"meetup"] = @{};
	
    // consumer_key and consumer_secret are required
    SimpleAuth.configuration[@"tumblr"] = @{};
	
    // client_id and redirect_uri are required
    SimpleAuth.configuration[@"foursquare-web"] = @{};
    
    // client_id and redirect_uri are required
    SimpleAuth.configuration[@"dropbox-web"] = @{};
    
    // client_id, client_secret, and and redirect_uri are required
    SimpleAuth.configuration[@"linkedin-web"] = @{};
}


#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureAuthorizaionProviders];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
