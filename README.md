# react-native-linea

# INSTALLATION

Read this:
http://stackoverflow.com/questions/13935378/how-do-i-use-the-linea-pro-sdk-for-ios
Especially the 2nd answer (its more recent than the other one)

## Using this package
Include the class at the top of your file like:
```import LineaPro from 'react-native-linea'```

You should create an instance of the LineaPro and save it somewhere. I don't have the best practice, but
I saved it in the state (which is probably bad practice, so let me know if you have a better one):

```
import React from 'react';
import LineaPro from 'react-native-linea';

class Test extends React.Component {
    constructor() {
        this.setState({
            linea: new LineaPro(),
        });
    }
    ...
}
```

this.state.lp.addConnectionStateListener(this.listenConnectionState);
    this.state.lp.addRfCardListener(this.listenRfCardInfo)
    this.state.lp.addDebugListener(this.listenDebug);
    this.state.lp.initialize();

### Available methods
`initialize`
`addConnectionStateListener(callback)`
`addRfCardListener(callback)`
`addDebugListener(callback)`

#### Example
```
...
import LineaPro from 'react-native-linea';

class Test extends React.Component {
    constructor() {
        ...
        this.setState({
            linea: new LineaPro
        })

        this.connectionStateListener = this.connectionStateListener.bind(this);
        this.rfCardInfoListener = this.rfCardInfoListener.bind(this);
        this.debugListener = this.debugListener.bind(this);
        this.magneticInfoListener = this.magneticInfoListener.bind(this);
    }

    componentDidMount() {
        this.state.linea.initialize();

        this.state.linea.addConnectionStateListener(this.connectionStateListener);
        this.state.linea.addDebugListener(this.debugListener);
        this.state.linea.addRfCardListener(this.rfCardInfoListener);
        this.state.linea.addMagneticInfoListener(this.magneticInfoListener);
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
}
```
