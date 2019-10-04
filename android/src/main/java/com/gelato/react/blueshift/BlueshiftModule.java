package com.gelato.react.blueshift;

import com.blueshift.Blueshift;
import com.blueshift.model.UserInfo;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;

import java.io.IOException;

public class BlueshiftModule extends ReactContextBaseJavaModule {

    private static final String EMAIL = "email";
    private static final String RETAILER_CUSTOMER_ID = "retailer_customer_id";
    private static final String NAME = "name";
    private static final String FIRSTNAME = "firstname";
    private static final String LASTNAME = "lastname";
    private static final String GENDER = "gender";
    private static final String JOINED_AT = "joined_at";
    private static final String FACEBOOK_ID = "facebook_id";
    private static final String EDUCATION = "education";
    private static final String UNSUBSCRIBED = "unsubscribed";
    private static final String DETAILS = "details";
    private static final String DATE_OF_BIRTH = "dateOfBirth";
    private static final String BIRTH_DAY = "birth_day";
    private static final String BIRTH_MONTH = "birth_month";
    private static final String BIRTH_YEAR = "birth_year";
    private final ReactApplicationContext reactContext;

    BlueshiftModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "Blueshift";
    }

    @ReactMethod
    public void setUserInfo(ReadableMap userInfo) {
        UserInfo blueshiftUserInfo = UserInfo.getInstance(reactContext);

        String email = userInfo.getString(EMAIL);
        if (email != null) {
            blueshiftUserInfo.setEmail(email);
        }
        if (userInfo.hasKey(RETAILER_CUSTOMER_ID)) {
            blueshiftUserInfo.setRetailerCustomerId(userInfo.getString(RETAILER_CUSTOMER_ID));
        }
        if (userInfo.hasKey(NAME)) {
            blueshiftUserInfo.setName(userInfo.getString(NAME));
        }
        if (userInfo.hasKey(FIRSTNAME)) {
            blueshiftUserInfo.setFirstname(userInfo.getString(FIRSTNAME));
        }
        if (userInfo.hasKey(LASTNAME)) {
            blueshiftUserInfo.setLastname(userInfo.getString(LASTNAME));
        }
        if (userInfo.hasKey(GENDER)) {
            blueshiftUserInfo.setGender(userInfo.getString(GENDER));
        }
        if (userInfo.hasKey(JOINED_AT)) {
            blueshiftUserInfo.setJoinedAt(userInfo.getInt(JOINED_AT));
        }
        if (userInfo.hasKey(FACEBOOK_ID)) {
            blueshiftUserInfo.setFacebookId(userInfo.getString(FACEBOOK_ID));
        }
        if (userInfo.hasKey(EDUCATION)) {
            blueshiftUserInfo.setEducation(userInfo.getString(EDUCATION));
        }
        if (userInfo.hasKey(UNSUBSCRIBED)) {
            blueshiftUserInfo.setUnsubscribed(userInfo.getBoolean(UNSUBSCRIBED));
        }
        if (userInfo.hasKey(DETAILS)) {
            blueshiftUserInfo.setDetails(userInfo.getMap(DETAILS).toHashMap());
        }
        if (userInfo.hasKey(DATE_OF_BIRTH)) {
            ReadableMap dateOfBirth = userInfo.getMap(DATE_OF_BIRTH);
            blueshiftUserInfo.setDateOfBirth(
                    dateOfBirth.getInt(BIRTH_DAY),
                    dateOfBirth.getInt(BIRTH_MONTH),
                    dateOfBirth.getInt(BIRTH_YEAR)
            );

        }
        blueshiftUserInfo.save(reactContext);
    }

    @ReactMethod
    public void trackEvent(final String eventName,
                           ReadableMap params,
                           final boolean canBatchThisEvent) {
        Blueshift.getInstance(reactContext)
                .trackEvent(eventName, params.toHashMap(), canBatchThisEvent);
    }

    @ReactMethod
    public void identify(ReadableMap details,
                         final boolean canBatchThisEvent) {
        String advertisingId = "";
        try {
            advertisingId = AdvertisingIdClient.getAdvertisingIdInfo(reactContext).getId();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (GooglePlayServicesNotAvailableException e) {
            e.printStackTrace();
        } catch (GooglePlayServicesRepairableException e) {
            e.printStackTrace();
        }
        Blueshift.getInstance(reactContext)
                .identifyUserByDeviceId(advertisingId, details.toHashMap(), canBatchThisEvent);
    }

    @ReactMethod
    public void trackScreenView(final String screenName,
                           final boolean canBatchThisEvent) {
        Blueshift.getInstance(reactContext)
                .trackScreenView(screenName, canBatchThisEvent);
    }

}
