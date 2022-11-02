import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'react-native-ogg-oga-decoder' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const OggOgaDecoder = NativeModules.OggOgaDecoder
  ? NativeModules.OggOgaDecoder
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function decode(oggFile: string): Promise<string> {
  return OggOgaDecoder.decode(oggFile);
}
