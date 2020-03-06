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
import { LineChart, BarChart, HorizontalBarChart, PieChart } from 'native-chart-experiment';

class App extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      linedata: [200.0, 0.0, 10.0, 25.0, 15.0, 5.0, 30.0, 300, 40.0, 10.0],
      bardata: [200, 500, 600, 700, 70, 500, 500, 600, 700, 800],
      barLabels: ["I", "II", "III", "IV IV ", "V", "VI", "VII", "VIII", "IX", "X"],
      darkMode: false
    }
  }

  render() {
    const { root } = styles;
    const { linedata, barLabels, bardata, darkMode } = this.state;

    return (
      <SafeAreaView style={[root, darkMode ? {backgroundColor: 'black'} : null]}>
        <ScrollView style={root}>
          <PieChart style={{height: 200, margin: 8}}
            chartData={[100, 20, 50, 60]} dataLabels={['Henry', 'Thomas', 'Peter', 'Cody']}
            legendLabel="White" darkMode={darkMode} />
          <LineChart style={{height: 120, margin: 8}}
            chartData={linedata} 
            legendLabel="White" darkMode={darkMode} themeColor="#03A9F4"/>
          <BarChart style={{height: 120, margin: 8}}
            chartData={bardata} xAxisLabels={barLabels}
            legendLabel="White" darkMode={darkMode} themeColor="#F44336"/>
          <HorizontalBarChart style={{height: 140, margin: 8}}
            chartData={bardata} xAxisLabels={barLabels}
            legendLabel="White" darkMode={darkMode} themeColor="#F44336"/>
          <HorizontalBarChart style={{height: 120}}
            chartData={bardata.map(v => v)} xAxisLabels={barLabels}
            legendLabel="White" darkMode={darkMode} themeColor="#F44336"/>
          <HorizontalBarChart style={{height: 200, margin: 8}}
            chartData={[118199, 102071, 96614, 88175, 75439, 89817, 103086, 80500]} 
            xAxisLabels={["Bourgogne", "Thunderer", "Ohio", "Kremlin", "Großer Kurfürst", "République", "Conqueror", "Yamato"]}
            legendLabel="White" darkMode={darkMode} themeColor="#4CAF50"/>
          <BarChart style={{height: 200, margin: 8}}
            chartData={[118199, 102071, 96614, 88175, 75439, 89817, 103086, 80500]} 
            xAxisLabels={["Bourgogne", "Thunderer", "Ohio", "Kremlin", "Großer Kurfürst", "République", "Conqueror", "Yamato"]}
            legendLabel="White" darkMode={darkMode} themeColor="#4CAF50"/>
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
