import React, { Component } from 'react'
import { AppRegistry, View, Text } from 'react-native'
import Timetable from './components/Timetable/Timetable'

export default class Personal extends Component {
  var shit;
  render () {
    var hello = 2;
    
    
    return <Timetable />
  }
}

AppRegistry.registerComponent('Personal', () => Personal)

/*
import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

export default class Personal extends Component {
  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Yo whats up?
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.android.js
        </Text>
        <Text style={styles.instructions}>
          Double tap R on your keyboard to reload,{'\n'}
          Shake or press menu button for dev menu
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('Personal', () => Personal);
*/
