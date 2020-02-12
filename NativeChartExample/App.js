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
  View,
  ScrollView,
  Text
} from 'react-native';
import { NativeChart } from 'react-native-native-chart';

const App = () => {
  const { root, chart } = styles
  return (
    <SafeAreaView style={root}>
      <View style={chart}>
        <NativeChart style={chart} data={new Array([20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0])}/>
      </View>
      <View style={chart}>
        <NativeChart data={new Array([20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0])}/>
      </View>
      <View style={chart}>
        <NativeChart data={new Array([20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0])}/>
      </View>
      <View style={chart}>
        <NativeChart data={new Array([20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0])}/>
      </View>
      <View style={chart}>
        <NativeChart data={new Array([20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0])}/>
      </View>
      <NativeChart data={new Array([20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0])}/>
      <NativeChart data={new Array([20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0])}/>
      <NativeChart data={new Array([20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0])}/>
      <NativeChart data={new Array([20.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0])}/>
      <Text>What</Text>
      <Text>What</Text>
      <Text>What</Text>
      <Text>What</Text>
      <Text>What</Text>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  root: {
    flex: 1,
  },
  chart: {
    position: 'relative'
  }
});

export default App;
