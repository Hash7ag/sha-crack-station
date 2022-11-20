import Foundation

public class CrackStation: Decrypter {
    private let dataDict: Dictionary<String, String>

    required public init() {
        // load data.json and assign to dataDict as dictionary
        // if loading file fail, dataDict will be empty
        if let path = Bundle.module.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: path)
                let jsonData = try JSONSerialization.jsonObject(with: data)
                if let jsonResult = jsonData as? Dictionary<String, String> {
                    self.dataDict = jsonResult
                }
                else {
                    self.dataDict = [:]
                    print ("\"data.json\" might be empty or corruption.")
                }
            }
            catch {
                self.dataDict = [:]
                print ("\(error)\nSerialization JSON failed. \"data.json\" might be corruption.")
            }
        }
        else {
            self.dataDict = [:]
            print ("\"data.json\" is not found.")
        }
    }

    public func decrypt(shaHash: String) -> String? {
        return self.dataDict[shaHash]
    }
}