import Foundation

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
}
