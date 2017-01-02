//
//  react_native_linea.m
//  react-native-linea
//
//  Created by Angelo on 30-12-16.
//  Copyright © 2016 Angelo. All rights reserved.
//

#import "RCTLinea.h"
#import "RCTEventDispatcher.h"

@implementation RCTLinea

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(getObject:(NSString *)key callback:(RCTResponseSenderBlock)cb) {
    linea = [DTDevices sharedDevice];
    BOOL connected = [linea isPresent:DEVICE_TYPE_LINEA];
    if (connected) {
        cb(@[[NSNull null], @"Connected"]);
    }
    else {
        cb(@[[NSNull null], @"Not Connected"]);
    }
}

RCT_REMAP_METHOD(connect, resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject) {
    NSString *name = @"hahah wtf";
    linea = [DTDevices sharedDevice];
    BOOL connected = [linea isPresent:DEVICE_TYPE_LINEA];
    if (connected) {
        resolve(@"connect");
    }
    else {
        resolve(@"not connected");
    }

    if ([name isEqualToString:@"hahah wtf"]) {
        resolve(name);
    }
    else {
        NSError *error = [NSError errorWithDomain:@"Wrong string" code:200 userInfo:@{}];
        reject(@"no string", @"Wrong string name", error);
    }
}

- (void)connectionState:(int)state {
    
    NSString *eventName = @"connection_state";
//    RCTTextEventType
//      [self.bridge.eventDispatcher sendTextEventWithType:RCTTextEventTypeChange reactTag:<#(NSNumber *)#> text:<#(NSString *)#> key:<#(NSString *)#> eventCount:<#(NSInteger)#>]
}

@end
