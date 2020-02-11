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
  Text
} from 'react-native';
import { NativeChart } from 'react-native-native-chart';

const App = () => {
  const { root } = styles
  return (
    <SafeAreaView style={root}>
      <NativeChart />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  root: {
    flex: 1,
  }
});

export default App;
