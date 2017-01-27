'use strict'
import { Linea } from './NativeBridges';
import { NativeEventEmitter } from 'react-native';

export default class LineaPro {
    constructor() {
        this.evt = new NativeEventEmitter(Linea);
    }

    initialize() {
        Linea.initializeScanner();
    }

    addConnectionStateListener(callback) {
        return this.evt.addListener('connectionState', (data) => {
            if (data === "connected") {
                callback(true);
            }
            else {
                callback(false);
            }
        });
    }

    addDebugListener(callback) {
        return this.evt.addListener('debug', (data) => {
            console.log(data);
            callback(data);
        });
    }

    addRfCardListener(callback) {
        return this.evt.addListener('rfcardInfo', (data) => {
            callback(data);
        });
    }

    addMagneticInfoListener(callback) {
        return this.evt.addListener('magneticInfo', (data) => {
            callback(data);
        });
    }

    scanRf() {
        Linea.scanRfId();
    }
}
