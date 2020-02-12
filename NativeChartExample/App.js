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

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      data: [0.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0],
    }

    setInterval(() => {
      this.setState({
        data: Array.from({length: 10}, () => Math.floor(Math.random() * 50))
      });
    }, 2000);
  }

  render() {
    const { root } = styles
    return (
      <SafeAreaView style={root}>
        <NativeChart style={{height: 300, margin: 8}} chartData={this.state.data}/>
      </SafeAreaView>
    );
  }
};

const styles = StyleSheet.create({
  root: {
    flex: 1,
    justifyContent: 'center',
  }
});

export default App;
