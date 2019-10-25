import Foundation
import BlueShift_iOS_SDK

@objc(Blueshift)
class Blueshift: NSObject {
    
    @objc
    func setUserInfo(_ userInfo: [String: Any]?) -> Void {
        guard let userInfo = userInfo else {
            return
        }
        
        if let email = userInfo["email"] as? String {
            BlueShiftUserInfo.sharedInstance().email = email
        }
        
        if let retailerCustomerID = userInfo["retailer_customer_id"] as? String {
            BlueShiftUserInfo.sharedInstance().retailerCustomerID = retailerCustomerID
        }
        
        if let name = userInfo["name"] as? String {
            BlueShiftUserInfo.sharedInstance().name = name
        }
        
        if let firstName = userInfo["firstname"] as? String {
            BlueShiftUserInfo.sharedInstance().firstName = firstName
        }
        
        if let lastName = userInfo["lastname"] as? String {
            BlueShiftUserInfo.sharedInstance().lastName = lastName
        }
        
        if let gender = userInfo["gender"] as? String {
            BlueShiftUserInfo.sharedInstance().gender = gender
        }
        
        if let joinedAt = userInfo["joined_at"] as? Date {
            BlueShiftUserInfo.sharedInstance().joinedAt = joinedAt
        }
        
        if let facebookID = userInfo["facebook_id"] as? String {
            BlueShiftUserInfo.sharedInstance()?.facebookID = facebookID
        }
        
        if let education = userInfo["education"] as? String {
            BlueShiftUserInfo.sharedInstance()?.education = education
        }
        
        if let unsubscribed = userInfo["unsubscribed"] as? Bool {
            BlueShiftUserInfo.sharedInstance().unsubscribed = unsubscribed
        }
        
        if let details = userInfo["details"] as? Dictionary<AnyHashable, Any> {
            BlueShiftUserInfo.sharedInstance().additionalUserInfo = details
        }
        
        if let dateOfBirth = userInfo["dateOfBirth"] as? Dictionary<String, Int>,
            let birthDay = dateOfBirth["birth_day"],
            let birthMonth = dateOfBirth["birth_month"],
            let birthYear = dateOfBirth["birth_year"] {
            
            let calendar = Calendar(identifier: .gregorian)
            var dateComponents = DateComponents()
            dateComponents.year = birthYear
            dateComponents.month = birthMonth
            dateComponents.day = birthDay
            
            if let birthDate = calendar.date(from: dateComponents) {
                BlueShiftUserInfo.sharedInstance()?.dateOfBirth = birthDate
            }
        }
        
        BlueShiftUserInfo.sharedInstance().save()
    }
    
    @objc(trackEvent:andParams:andCanBatchThisEvent:)
    func trackEvent(_ eventName: String, _ params: [String: Any]?, _ canBatchThisEvent: Bool) -> Void {
        if let params = params {
            BlueShift.sharedInstance().trackEvent(forEventName: eventName, andParameters: params, canBatchThisEvent: canBatchThisEvent)
        } else {
            BlueShift.sharedInstance().trackEvent(forEventName: eventName, canBatchThisEvent: canBatchThisEvent)
        }
    }
    
    @objc(identify:andCanBatchThisEvent:)
    func identify(details: [String: Any]?, canBatchThisEvent: Bool) -> Void {
        BlueShift.sharedInstance().identifyUser(withDetails:details, canBatchThisEvent: canBatchThisEvent)
    }
    
    @objc(identifyWithEmail:andDetails:andCanBatchThisEvent:)
    func identifyWithEmail(email: String, details: [String: Any]?, canBatchThisEvent: Bool) -> Void {
        BlueShift.sharedInstance().identifyUser(withEmail: email, andDetails: details, canBatchThisEvent: canBatchThisEvent)
    }
    
    @objc(trackScreenView:andCanBatchThisEvent:)
    func trackScreenView(screenName: String, canBatchThisEvent: Bool) -> Void {
        var parameters: [AnyHashable: Any] = [:]
        parameters["screen_viewed"] = screenName;
        BlueShift.sharedInstance()?.trackEvent(forEventName: kEventPageLoad, andParameters: parameters, canBatchThisEvent: canBatchThisEvent)
    }
    
    @objc(trackProductView:andCanBatchThisEvent:)
    func trackProductView(params: [String: Any]?, canBatchThisEvent: Bool) -> Void {
        guard let sku = params?[BlueshiftFields.sku] as? String,
            let categoryId = params?[BlueshiftFields.categoryId] as? Int else {
                return
        }
        
        if let details = params?[BlueshiftFields.details] as? [AnyHashable: Any] {
            BlueShift.sharedInstance()?.trackProductViewed(withSKU: sku,
                                                           andCategoryID: categoryId,
                                                           withParameter: details,
                                                           canBatchThisEvent: canBatchThisEvent)
        } else {
            BlueShift.sharedInstance()?.trackProductViewed(withSKU: sku,
                                                           andCategoryID: categoryId,
                                                           canBatchThisEvent: canBatchThisEvent)
        }
    }
    
    @objc(trackAddToCart:andCanBatchThisEvent:)
    func trackAddToCart(params: [String: Any]?, canBatchThisEvent: Bool) -> Void {
        guard let sku = params?[BlueshiftFields.sku] as? String,
            let quantity = params?[BlueshiftFields.quantity] as? Int else {
                return
        }
        
        if let params = params {
            BlueShift.sharedInstance()?.trackAddToCart(withSKU: sku, andQuantity: quantity, andParameters: params, canBatchThisEvent: canBatchThisEvent)
        } else {
            BlueShift.sharedInstance()?.trackAddToCart(withSKU: sku, andQuantity: quantity, canBatchThisEvent: canBatchThisEvent)
        }
    }
    
    
    private struct BlueshiftFields {
        static let details = "details";
        static let sku = "sku";
        static let categoryId = "categoryId";
        static let quantity = "quantity"
    }
}
