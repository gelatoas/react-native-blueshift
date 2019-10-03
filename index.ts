import { NativeModules } from 'react-native';
import { UserInfo } from './src/UserInfo';

const { Blueshift } = NativeModules;

export const setUserInfo = (userInfo: UserInfo) => {
  Blueshift.setUserInfo(userInfo)
};

export const log = (eventName: string, params: Object, canBatchThisEvent: boolean) => {
  Blueshift.trackEvent(eventName, params, canBatchThisEvent)
};

export default Blueshift;
