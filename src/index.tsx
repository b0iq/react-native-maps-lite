import {
  requireNativeComponent,
  UIManager,
  Platform,
  ViewStyle,
} from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-maps-lite' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

type MapsLiteProps = {
  initialRegion?: {
    latitude: number;
    longitude: number;
    zoomLevel: number;
  };
  showUserLocation?: boolean;
  showCompass?: boolean;
  onMapDidMove?: (event: {
    nativeEvent: {
      latitude: number;
      longitude: number;
      zoomLevel: number;
      longitudeDelta: number;
      latitudeDelta: number;
    };
  }) => void;
  onMapWillMove?: () => void;
  // Others
  style: ViewStyle;
};

const ComponentName = 'MapsLiteView';

export const MapsLiteView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<MapsLiteProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };
