//
//  react_native_linea.h
//  react-native-linea
//
//  Created by Angelo on 30-12-16.
//  Copyright © 2016 Angelo. All rights reserved.
//

#import "RCTBridgeModule.h"
#import "RCTEventEmitter.h"
#import "DTDevices.h"

@interface RCTLinea : RCTEventEmitter <RCTBridgeModule, DTDeviceDelegate> {
    
    DTDevices *linea;
    BOOL isConnected;
    BOOL rfidOn;
}

@end
