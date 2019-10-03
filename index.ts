import { NativeModules } from 'react-native';
import { UserInfo } from './src/UserInfo';

const { Blueshift } = NativeModules;

export const setUserInfo = (userInfo: UserInfo) => {
  Blueshift.setUserInfo(userInfo)
};

export const trackEvent = (eventName: string, params: Object, canBatchThisEvent: boolean) => {
  Blueshift.trackEvent(eventName, params, canBatchThisEvent)
};

export const identify = (details: Object, canBatchThisEvent: boolean) => {
  Blueshift.identify(details, canBatchThisEvent)
};

export default Blueshift;
