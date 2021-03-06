import Foundation

open class SwiftyDefaults: NSObject {
    let userDefaults = UserDefaults.standard
    
    public override init() {
        super.init()
        
        registerDefaults()
        setupProperty()
        addObserver()
    }
    
    deinit {
        removeObserver()
    }
}

extension SwiftyDefaults {
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let keyPath = keyPath {
            if let value = change?[.newKey] , !(value is NSNull) {
                userDefaults.set(value is NSCoding ? NSKeyedArchiver.archivedData(withRootObject: value) : value, forKey: storeKey(keyPath))
            }else{
                userDefaults.removeObject(forKey: storeKey(keyPath))
            }
            
            userDefaults.synchronize()
        }
    }
}

extension SwiftyDefaults {
    fileprivate func storeKey(_ propertyName: String) -> String{
        return "\(type(of: self))_\(propertyName)"
    }
    
    fileprivate func registerDefaults() {
        // TODO: Check if "Any" is correct type
        // If it's not use dic[storeKey(key)] = value(forKey: key) as AnyObject?
        let dic = propertyNames.reduce([String:Any]()) { (dic, key) -> [String:Any] in
            var dic = dic
            dic[storeKey(key)] = value(forKey: key)
            return dic
        }
        userDefaults.register(defaults: dic)
    }
    
    fileprivate func setupProperty() {
        propertyNames.forEach {
            let value = userDefaults.object(forKey: storeKey($0))
            if let data = value as? Data, let decodedValue = NSKeyedUnarchiver.unarchiveObject(with: data){
                setValue(decodedValue, forKey: $0)
            }else{
                setValue(value, forKey: $0)
            }
        }
    }
    
    fileprivate func addObserver() {
        propertyNames.forEach {
            addObserver(self, forKeyPath: $0, options: .new, context: nil)
        }
    }
    
    fileprivate func removeObserver() {
        propertyNames.forEach {
            removeObserver(self, forKeyPath: $0)
        }
    }
    
    fileprivate var propertyNames: [String] {
        return Mirror(reflecting: self).children.flatMap { $0.label }
    }
}
