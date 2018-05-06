//

import Foundation


extension String
{
    var length : Int {
        return self.characters.count
    }
    var isValidEmail: Bool {
        let emailRegex = "^([a-zA-Z0-9_\\-\\.+]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    var isPhoneNumber: Bool {
        
        let PHONE_REGEX = "^(?:(?:\\+?1\\s*(?:[.-]\\s*)?)?(?:\\(\\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\\s*\\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\\s*(?:[.-]\\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\\s*(?:[.-]\\s*)?([0-9]{4})(?:\\s*(?:#|x\\.?|ext\\.?|extension)\\s*(\\d+))?$"
        return self.matchPattern(pattern: PHONE_REGEX, andOption: NSRegularExpression.Options.caseInsensitive)
    }
    
    func matchPattern(pattern : String, andOption option : NSRegularExpression.Options) -> Bool {
        
        if(self.length == 0 || pattern.length == 0) {
            return false
        }
        do {
            let regex : NSRegularExpression = try NSRegularExpression(pattern: pattern,options: option)
            
            let numberMatches = regex.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.length))
            
            if(numberMatches == 1){
                return true
            }
            else{
                return false
            }
        }
            
        catch let error as NSError {
            print(error.localizedDescription)
            return false
            
        }
        
        //        return true
        
    }
 
    var isPassword:Bool {
            let passwordRegEx = "^.*(?=.{8,})(?=..*[0-9])(?=.*[a-z])(?=.*[A-Z]).*$"
            return NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: self)
    }
    
    func stringByRemovingAll(characters: [Character]) -> String {
        return String(self.characters.filter({ !characters.contains($0) }))
    }
    
    
    
  }
