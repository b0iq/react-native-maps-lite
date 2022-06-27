import * as React from 'react';

import { Button, Dimensions, StyleSheet, View } from 'react-native';
import { MapsLiteView } from 'react-native-maps-lite';
const { width, height } = Dimensions.get('screen');
const initialRegion = {
  latitude: 25.2048,
  longitude: 55.2708,
  zoomLevel: 15,
};

export default function App() {
  const [isMapShowed, setIsMapShowed] = React.useState(true);
  return (
    <View style={styles.container}>
      <View style={styles.floatingButton}>
        <Button
          title="Toggle Maps"
          onPress={() => setIsMapShowed((prev) => !prev)}
        />
      </View>
      {isMapShowed && (
        <MapsLiteView
          onMapDidMove={(e) => {
            console.log(e.nativeEvent);
          }}
          onMapWillMove={() => {
            console.log('onMapWillMove');
          }}
          initialRegion={initialRegion}
          showCompass={true}
          showUserLocation={true}
          style={styles.box}
        />
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  floatingButton: {
    position: 'absolute',
    top: '50%',
    left: '50%',
    zIndex: 100,
  },
  box: {
    width,
    height,
  },
});
