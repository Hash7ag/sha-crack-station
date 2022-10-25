import Foundation

public class CrackStation: Decrypter {
    private var dataDict: Dictionary<String, String> = [:]

    required public init() {
        if let path = Bundle.module.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let jsonData = try JSONSerialization.jsonObject(with: data)
                if let jsonResult = jsonData as? Dictionary<String, String> {
                    self.dataDict = jsonResult
                }
                else {
                    print ("\"data.json\" is empty.")
                }
            }
            catch {
                print ("\(error)\nSerialization JSON failed. \"data.json\" might be corruption.")
            }
        }
    }

    public func decrypt(shaHash: String) -> String? {
        return self.dataDict[shaHash]
    }
}