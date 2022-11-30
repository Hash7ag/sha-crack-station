# Swift SHA CrackStation Library
A Swift library for cracking hash ciphertext

## Overview
This library aims to crack unsalted [SHA-1](https://en.wikipedia.org/wiki/SHA-1) and [SHA-2](https://en.wikipedia.org/wiki/SHA-2) (SHA-256) hashed text. It is able to decrypt/crack/brute-force the ciphertext which its plaintext matches  `^[A-Za-z0-9?!]{1,3}$` by a pre-generated dictionary (JSON file).

## Mission Statement
[SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithms) is a common hashing algorithm for online servers to store sensitive authentication information. This project is showing how to crack or brute force unsalted hashes (passwords) easily if the password is too short. Hopefully, it can improve general people's cybersecurity awareness.

## Installation
### Swift Package Manager
The [Swift Package Manager](https://www.swift.org/package-manager) is a tool for managing the distribution of Swift code. It's integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies."

### Steps
1. Once you have your Swift package set up, add CrackStation to the list of dependencies in `Package.swift` file.
    ```
    .package(url: "git@github.com:Hash7ag/CrackStation.git", from: "1.0.0")
    ```
    which will look like:
    ```
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "git@github.com:Hash7ag/CrackStation.git", from: "1.0.0"),

        ...
    ]
    ```
2. The `dependencies` under target also need to be added, which should look like:
    ```
    targets: [
        .target(
            name: "<TARGET-NAME>",
            dependencies: [
                "CrackStation",

                ...
            ],

            ...
        ),

        ...
    ]
    ```

## Usage
### Steps
1. Import the library `CrackStation`.
2. Assign class `CrackStation()` to a constant or a variable.
3. Now, You should be able to call the `decrypt` function by the constant/variable from the last step, and pass your ciphertext with the argument `shaHash`.
   1. If the ciphertext is crackable, it will return the plaintext.
   2. Otherwise, it will return a nill.
### Example
```
import CrackStation

...

let myCrackStation: Decrypter = CrackStation()

let myHash:String = "482e1ae75acdf731feeddc4875fd0fc05ea436a3d751506163989e998ab1038d"
let yourHash:String = "afa27b44d43b02a9fea41d13cedc2e4016cfcf87c5dbf990e593669aa8ce286d"

let myPlaintext:String? = myCrackStation.decrypt(shaHash = myHash)
let yourPlaintext:String? = myCrackStation.decrypt(shaHash = yourHash)

print(myPlaintext ?? "Undecryptable")       // which should print `AbC`
print(yourPlaintext ?? "Undecryptable")     // which should print `Undecryptable`

...
```

## Author
Hash7ag

## License
This project is licensed under the [GNU v3.0 License](LICENSE).