# react-native-linea

# HOW TO INSTALL

Read this:
http://stackoverflow.com/questions/13935378/how-do-i-use-the-linea-pro-sdk-for-ios
Especially the 2nd answer (its more recent than the other one)

## Using this package
Include the class at the top of your file like:
```import LineaPro from 'react-native-linea'```

You should create an instance of the LineaPro and save it somewhere. I don't have the best practice, but
I saved it in the state (which is probably bad practice, so let me know if you have a better one):

```
class Test extends React.Component {
    constructor() {
        this.setState({
            linea: new LineaPro(),
        });
    }
    ...
}
```
