# react-native-blueshift

## Getting started

`$ npm install react-native-blueshift --save`

### Mostly automatic installation

`$ react-native link react-native-blueshift`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-blueshift` and add `Blueshift.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libBlueshift.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.reactlibrary.BlueshiftPackage;` to the imports at the top of the file
  - Add `new BlueshiftPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-blueshift'
  	project(':react-native-blueshift').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-blueshift/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-blueshift')
  	```


## Usage
```javascript
import Blueshift from 'react-native-blueshift';

// TODO: What to do with the module?
Blueshift;
```
