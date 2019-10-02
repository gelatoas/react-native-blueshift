package com.reactlibrary;

import com.blueshift.model.UserInfo;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

public class BlueshiftModule extends ReactContextBaseJavaModule {

    private static final String EMAIL = "email";
    private static final String EMAIL_HASH = "email_hash";
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
        if(email != null){
            blueshiftUserInfo.setEmail(email);
        }

        String emailHash = userInfo.getString(EMAIL_HASH);
        if(emailHash != null){
            blueshiftUserInfo.setEmailHash(emailHash);
        }

        String retailerCustomerId = userInfo.getString(RETAILER_CUSTOMER_ID);
        if(retailerCustomerId != null){
            blueshiftUserInfo.setRetailerCustomerId(retailerCustomerId);
        }
        String name = userInfo.getString(NAME);
        if(name != null){
            blueshiftUserInfo.setName(name);
        }
        String firstname = userInfo.getString(FIRSTNAME);
        if(firstname != null){
            blueshiftUserInfo.setFirstname(firstname);
        }
        String lastname = userInfo.getString(LASTNAME);
        if(lastname != null){
            blueshiftUserInfo.setLastname(lastname);
        }
        String gender = userInfo.getString(GENDER);
        if(gender != null){
            blueshiftUserInfo.setGender(gender);
        }
        if(userInfo.hasKey(JOINED_AT)){
            blueshiftUserInfo.setJoinedAt(userInfo.getInt(JOINED_AT));
        }
        String facebookId = userInfo.getString(FACEBOOK_ID);
        if(facebookId != null){
            blueshiftUserInfo.setFacebookId(facebookId);
        }
        String education = userInfo.getString(EDUCATION);
        if(education != null){
            blueshiftUserInfo.setEducation(education);
        }
        if(userInfo.hasKey(UNSUBSCRIBED)){
            blueshiftUserInfo.setUnsubscribed(userInfo.getBoolean(UNSUBSCRIBED));
        }
        ReadableMap details = userInfo.getMap(DETAILS);
        if(details != null){
            blueshiftUserInfo.setDetails(details.toHashMap());
        }
        ReadableMap dateOfBirth = userInfo.getMap(DATE_OF_BIRTH);
        if(dateOfBirth != null){
            blueshiftUserInfo.setDateOfBirth(
                    dateOfBirth.getInt(BIRTH_DAY),
                    dateOfBirth.getInt(BIRTH_MONTH),
                    dateOfBirth.getInt(BIRTH_YEAR)
            );

        }
        blueshiftUserInfo.save(reactContext);
    }
}
