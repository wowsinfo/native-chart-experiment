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
  View
} from 'react-native';
import { LineChart, BarChart, HorizontalBarChart, PieChart } from 'react-native-native-chart';

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      linedata: [200.0, 0.0, 10.0, 25.0, 15.0, 5.0, 30.0, 300, 40.0, 10.0],
      bardata: [10, 50, 60, 70, 200, 500, 50, 60, 70, 80],
      barLabels: ["I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X"],
      darkMode: false
    }
  }

  render() {
    const { root } = styles;
    const { linedata, barLabels, bardata, darkMode } = this.state;

    return (
      <SafeAreaView style={[root, darkMode ? {backgroundColor: 'black'} : null]}>
        <ScrollView style={root}>
          {/* <PieChart style={{height: 300, margin: 8}}
            chartData={[100, 20, 50, 60]} dataLabels={['Henry', 'Thomas', 'Peter', 'Cody']}
            legendLabel="White" darkMode={darkMode} themeColor="#6666FF"/> */}
          <LineChart style={{height: 300, margin: 8}}
            chartData={linedata} 
            legendLabel="White" darkMode={darkMode} themeColor="#8888FF"/>
          {/* <BarChart style={{height: 300, margin: 8}}
            chartData={bardata} xAxisLabels={barLabels}
            legendLabel="White" darkMode={darkMode} themeColor="#6666FF"/>
          <HorizontalBarChart style={{height: 300, margin: 8}}
            chartData={bardata} xAxisLabels={barLabels}
            legendLabel="White" darkMode={darkMode} themeColor="#6666FF"/> */}
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
