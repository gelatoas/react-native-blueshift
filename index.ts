import { NativeModules } from 'react-native';
import { UserInfo } from './src/UserInfo';
import { ProductViewParams } from './src/ProductView';

const { Blueshift } = NativeModules;

export const setUserInfo = (userInfo: UserInfo) => {
  Blueshift.setUserInfo(userInfo)
};

export const trackEvent = (eventName: string, params: Object, canBatchThisEvent = true) => {
  Blueshift.trackEvent(eventName, params, canBatchThisEvent)
};

export const identify = (details: Object, canBatchThisEvent = true) => {
  Blueshift.identify(details, canBatchThisEvent)
};

export const trackScreenView = (screenName: string, canBatchThisEvent = true) => {
  Blueshift.trackScreenView(screenName, canBatchThisEvent)
};

export const trackProductView = (productViewParams: ProductViewParams, canBatchThisEvent = true) => {
  Blueshift.trackProductView(productViewParams, canBatchThisEvent)
};

export default Blueshift;
