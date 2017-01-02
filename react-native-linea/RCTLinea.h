//
//  react_native_linea.h
//  react-native-linea
//
//  Created by Angelo on 30-12-16.
//  Copyright © 2016 Angelo. All rights reserved.
//

#import "RCTBridge.h"
#import "DTDevices.h"

@interface RCTLinea : NSObject <RCTBridgeModule, DTDeviceDelegate> {
    
    DTDevices *linea;
    
}

@end
