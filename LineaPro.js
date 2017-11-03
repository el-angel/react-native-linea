'use strict';
import { Linea } from './NativeBridges';
import { NativeEventEmitter } from 'react-native';

export default class LineaPro {
	constructor() {
		this.evt = new NativeEventEmitter(Linea);
	}

	// For setBarcodeScanMode
	static MODE_MULTI_SCAN = Linea.BUTTON_DISABLED;
	static MODE_SINGLE_SCAN = Linea.BUTTON_ENABLED;
	static MODE_MOTION_DETECT = Linea.MODE_MOTION_DETECT;
	static MODE_SINGLE_SCAN_RELEASE = Linea.MODE_SINGLE_SCAN_RELEASE;
	static MODE_MULTI_SCAN_NO_DUPLICATES = Linea.MODE_MULTI_SCAN_NO_DUPLICATES;

	// For setBarcodeScanButtonMode
	static BUTTON_DISABLED = Linea.BUTTON_DISABLED;
	static BUTTON_ENABLED = Linea.BUTTON_ENABLED;

	initialize() {
		Linea.initializeScanner();
	}

	setBarcodeScanMode(mode) {
		Linea.setBarcodeScanMode(mode);
	}

	setBarcodeScanBeep(enabled) {
		Linea.setBarcodeScanBeep(enabled);
	}

	setBarcodeScanButtonMode(mode) {
		Linea.setBarcodeScanButtonMode(mode);
	}

	playSound(volume, beepData) {
		Linea.playSound(volume, beepData);
	}

	addConnectionStateListener(callback) {
		return this.evt.addListener('connectionState', data => {
			if (data === 'connected') {
				callback(true);
			} else {
				callback(false);
			}
		});
	}

	addDebugListener(callback) {
		return this.evt.addListener('debug', data => {
			console.log(data);
			callback(data);
		});
	}

	addRfCardListener(callback) {
		return this.evt.addListener('rfcardInfo', data => {
			callback(data);
		});
	}

	addMagneticInfoListener(callback) {
		return this.evt.addListener('magneticInfo', data => {
			callback(data);
		});
	}

	addBarcodeInfoListener(callback) {
		return this.evt.addListener('barcodeInfo', data => {
			callback(data);
		});
	}

	scanRf() {
		Linea.scanRfId();
	}
}
