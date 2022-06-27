# react-native-maps-lite

Performant and minimal map view for react-native

## Installation

```sh
npm install react-native-maps-lite
```

## Usage

```js
import { MapsLiteView } from 'react-native-maps-lite';

export default () => {
  return (
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
  );
};
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
