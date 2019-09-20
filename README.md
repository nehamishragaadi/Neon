# react-native-neon-ios

## Getting started

`$ npm install react-native-neon-ios --save`

### Mostly automatic installation

`$ react-native link react-native-neon-ios`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-neon-ios` and add `NeonIos.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libNeonIos.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.reactlibrary.NeonIosPackage;` to the imports at the top of the file
  - Add `new NeonIosPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-neon-ios'
  	project(':react-native-neon-ios').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-neon-ios/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-neon-ios')
  	```


## Usage
```javascript
import NeonIos from 'react-native-neon-ios';

// TODO: What to do with the module?
NeonIos;
```
