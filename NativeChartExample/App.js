/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  View
} from 'react-native';
import { NativeChart } from 'react-native-native-chart';

const App = () => {
  const { root } = styles
  return (
    <SafeAreaView style={root}>
      <NativeChart data={new Array([20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0])}/>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  root: {
    flex: 1,
  }
});

export default App;
