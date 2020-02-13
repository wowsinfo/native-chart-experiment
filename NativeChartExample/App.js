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
  ScrollView,
  requireNativeComponent
} from 'react-native';
import LineChart from 'react-native-native-chart';

console.log(LineChart);

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
    const { root } = styles;
    console.log(LineChart);
    return (
      <SafeAreaView style={root}>
        <ScrollView style={root} >
          <LineChart style={{height: 300, margin: 8, backgroundColor: 'black'}} 
            chartData={[0.0, 10.0, 25.0, 15.0, 5.0, 30.0, 40.0, 10.0, 20.0, 45.0]} 
            legendLabel="White" darkMode themeColor="#FFFFFF"/>
        </ScrollView>
      </SafeAreaView>
    );
  }
};

const styles = StyleSheet.create({
  root: {
    flex: 1,
  }
});

export default App;
