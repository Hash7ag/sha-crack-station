import XCTest
import CrackStation

import Crypto

final class CrackStationTests: XCTestCase {
    private let crackStation: Decrypter = CrackStation()

    // MARK: - Happy path
    func testAllOneLetterSha1Permutations() throws {
        for letter in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" {
            // Given
            let password = String(letter)
            let shaHash = encrypt(password)

            // When
            let crackedPassword = crackStation.decrypt(shaHash: shaHash)

            // Then
            XCTAssertEqual(crackedPassword, password)
        }
    }

    // MARK: - Edge cases / rainy day scenarios
    func testEmptyString() throws {
        // Given
        let password = ""
        let shaHash = encrypt(password)

        // When
        let crackedPassword = crackStation.decrypt(shaHash: shaHash)

        // Then
        XCTAssertEqual(crackedPassword, nil)
    }

    func testInvalidShaHash() throws {
        // Given
        let password = "Hello-World"
        let shaHash = String(encrypt(password).suffix(5))

        // When
        let crackedPassword = crackStation.decrypt(shaHash: shaHash)

        // Then
        XCTAssertEqual(crackedPassword, nil)
    }

    // MARK: - Helpers
    private func encrypt(_ password: String) -> String {
        let dataToHash = Data(password.utf8)
        let shaHashDescription = String(Insecure.SHA1.hash(data: dataToHash).description)
        let shaHash = String(shaHashDescription.suffix(40))
        return shaHash
    }
}
