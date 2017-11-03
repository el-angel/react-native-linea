# react-native-linea

# INSTALLATION
```npm i react-native-linea --save```

Read this:
http://stackoverflow.com/questions/13935378/how-do-i-use-the-linea-pro-sdk-for-ios
Especially the 2nd answer (its more recent than the other one)

## Usage
Include the class at the top of your file like:
```import LineaPro from 'react-native-linea'```

```javascript
import React from 'react';
import LineaPro from 'react-native-linea';

class Test extends React.Component {
    constructor() {
        super()
        this.linea = new LineaPro();
    }
    ...
}
```

### Available methods

```
initialize
```
Initialize the scanner and make the app recognize it.

```
addConnectionStateListener(callback)
```
There's a delegate in objective c which is called when the scanner is connected. Give your function as a parameter to the above function and the data will be passed through to that function as a callback

```
addRfCardListener(callback)
```
Same as above, when an RF card is scanned, the data is passed through to your function

```
addDebugListener(callback)
```
Same as above, but then for debugging might you need it. Check the .m file if you want to debug.
You can add debug lines in the .m file which are send to JavaScript so you can debug.

```
scanRf
```
Call this function to activate the RF card scanner. The RF scanner is automatically turned off everytime a card is scanned.

#### Example
```javascript
...
import LineaPro from 'react-native-linea';

class Test extends React.Component {
    constructor() {
        super();
        this.linea = new LineaPro();
        this.connectionStateListener = this.connectionStateListener.bind(this);
        this.rfCardInfoListener = this.rfCardInfoListener.bind(this);
        this.debugListener = this.debugListener.bind(this);
        this.magneticInfoListener = this.magneticInfoListener.bind(this);
        this.activateScanner = this.activateScanner.bind(this);
    }

    componentDidMount() {
        this.linea.initialize();
        this.linea.addConnectionStateListener(this.connectionStateListener);
        this.linea.addDebugListener(this.debugListener);
        this.linea.addRfCardListener(this.rfCardInfoListener);
        this.linea.addMagneticInfoListener(this.magneticInfoListener);
    }

    activateScanner() {
        this.linea.scanRfId();
    }

    connectionStateListener(data) {
        ...
    }

    rfCardInfoListener(data) {
        ...     
    }
    
    debugListener(data) {
        ...
    }

    magneticInfoListener(data) {
        ...
    }

    render() {
        return (
            <TouchableOpacity onPress={this.activateScanner}>
                <View>
                    <Text>Activate scanner</Text>
                </View>
            </TouchableOpacity>
        )
    }
}
```
