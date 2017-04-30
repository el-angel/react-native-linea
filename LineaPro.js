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

    setBarcodeScanMode(mode) {
        Linea.setBarcodeScanMode(mode);
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

    addBarcodeInfoListener(callback) {
        return this.evt.addListener('barcodeInfo', (data) => {
            callback(data);
        });
    }

    scanRf() {
        Linea.scanRfId();
    }
}
