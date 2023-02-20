/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import {
  SafeAreaView,
  ScrollView,
  StatusBar,
  StyleSheet,
  Text,
  useColorScheme,
  useWindowDimensions,
  View,
} from 'react-native';

import {
  Colors,
  DebugInstructions,
  Header,
  LearnMoreLinks,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';
import RTNMyLinearGradient from 'rtn-my-linear-gradient/js/NativeMyLinearGradient';

function App(): JSX.Element {
  const isDarkMode = useColorScheme() === 'dark';

  const backgroundStyle = {
    backgroundColor: isDarkMode ? Colors.darker : Colors.lighter,
  };

  const {height, width} = useWindowDimensions();

  return (
    <SafeAreaView style={backgroundStyle}>
      <StatusBar
        barStyle={isDarkMode ? 'light-content' : 'dark-content'}
        backgroundColor={backgroundStyle.backgroundColor}
      />
      <RTNMyLinearGradient
        style={{
          height,
          width,
        }}
        color={[
          '#6b0707',
          '#00FFFF',
          '#FF0000',
          '#0000FF',
          '#F0F0F0',
          '#FFF000',
        ]}></RTNMyLinearGradient>
    </SafeAreaView>
  );
}

//yarn add ./RTNMyLinearGradient

// node rnapp/node_modules/react-native/scripts/generate-codegen-artifacts.js \
// --path rnapp/ \
// --outputPath rnapp/RTNMyLinearGradient/generated/

export default App;
