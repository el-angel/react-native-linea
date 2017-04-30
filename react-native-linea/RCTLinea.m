//
//  react_native_linea.m
//  react-native-linea
//
//  Created by Angelo on 30-12-16.
//  Copyright © 2016 Angelo. All rights reserved.
//

#import "RCTLinea.h"
#import "RCTBridgeModule.h"
#import "RCTEventDispatcher.h"
#import "RCTEventEmitter.h"

@implementation RCTLinea

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE();


#pragma mark Events
- (NSArray<NSString *> *)supportedEvents {
    return @[
                @"connectionState",
                @"rfcardInfo",
                @"debug",
                @"magneticInfo",
                @"barcodeInfo"
            ];
}

- (void)sendConnectionState:(NSString *)state {
    [self sendEventWithName:@"connectionState" body:state];
}

- (void)sendRfCardInfo:(NSString *)data {
    [self sendEventWithName:@"rfcardInfo" body:data];
}

- (void)sendDebug:(NSString *)debug {
    // [self sendEventWithName:@"debug" body:debug];
}
- (void)sendMagneticInfo:(NSString *)data {
    [self sendEventWithName:@"magneticInfo" body:data];
}

- (void)sendBarcodeInfo:(NSString *)data {
    [self sendEventWithName:@"barcodeInfo" body:data];
}

#pragma mark React Native Methods

RCT_EXPORT_METHOD(initializeScanner) {
    linea = [DTDevices sharedDevice];
    [linea setDelegate:self];
    [linea connect];
    rfidOn = NO;
    [self sendDebug:[[NSProcessInfo processInfo] globallyUniqueString]];
}

RCT_EXPORT_METHOD(scanRfId) {
    [linea connect];

    int methods = CARD_SUPPORT_TYPE_A + CARD_SUPPORT_TYPE_B + CARD_SUPPORT_FELICA + CARD_SUPPORT_NFC + CARD_SUPPORT_JEWEL + CARD_SUPPORT_ISO15 + CARD_SUPPORT_STSRI + CARD_SUPPORT_PICOPASS_ISO14 + CARD_SUPPORT_PICOPASS_ISO15;
    [linea rfInit:methods error:nil];
}

RCT_EXPORT_METHOD(setBarcodeScanMode:(int) mode) {
    [linea barcodeSetScanMode:mode error:nil];
}

#pragma mark DTDevices delegates

- (void)rfCardDetected:(int)cardIndex info:(DTRFCardInfo *)info {
    NSData *uidData = [info UID];
    NSString *string = [uidData base64EncodedStringWithOptions:nil];

    [self sendRfCardInfo:string];
}

- (void)magneticCardData:(NSString *)track1 track2:(NSString *)track2 track3:(NSString *)track3 {
    if (track1 != nil && ![track1 isEqualToString:@""]) {
        [self sendMagneticInfo:track1];
    }
    else if (track2 != nil && ![track2 isEqualToString:@""]) {
        [self sendMagneticInfo:track2];
    }
    else if (track3 != nil && ![track3 isEqualToString:@""]) {
        [self sendMagneticInfo:track3];
    }
    else {
        [self sendDebug:@"ALL TRACKS ARE EMPTY"];
    }
}

- (void)connectionState:(int)state {

    switch (state) {
        case CONN_CONNECTED:
            isConnected = YES;
            [self sendConnectionState:@"connected"];
            break;
        case CONN_CONNECTING:
            isConnected = NO;
            [self sendConnectionState:@"connecting"];
            break;
        case CONN_DISCONNECTED:
            isConnected = NO;
            [self sendConnectionState:@"disconnected"];
            break;
    }
}

-(void)barcodeData:(NSString *)barcode type:(int) type {
    [self sendBarcodeInfo:barcode];
}

@end
