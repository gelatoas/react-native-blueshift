import { NativeModules } from 'react-native';
import { UserInfo } from './src/UserInfo';

const { Blueshift } = NativeModules;

export const setUserInfo = (userInfo: UserInfo) => {
  Blueshift.setUserInfo(userInfo)
};

export default Blueshift;
