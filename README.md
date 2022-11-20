# SHA Crack Station
A Swift library for cracking hash ciphertext

## Overview
This library aims to crack unsalted [SHA-1](https://en.wikipedia.org/wiki/SHA-1) and [SHA-2](https://en.wikipedia.org/wiki/SHA-2) (SHA-256) hashed text. It is able to decrypt/crack/brute-force the ciphertext which its plaintext matches  `^[A-Za-z0-9?!]{1,3}$` by a pre-generated dictionary (JSON file).

## Mission Statement
[SHA](https://en.wikipedia.org/wiki/Secure_Hash_Algorithms) is a common hashing algorithm for online servers to store sensitive authentication information. This project is showing how to crack or brute force unsalted hashes (passwords) easily if the password is too short. Hopefully, it can improve general people's cybersecurity awareness.

## Setup
1. Add the following dependency into `Package.swift`:
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
1. Import the library `CrackStation`; then you should be able to call `decrypt` function and pass your ciphertext with the argument `shaHash`.
2. If the ciphertext is crackable, it will return the plaintext.
3. Otherwise, it will return a nill.

## Author
Hash7ag

## License
This project is licensed under the [GNU v3.0 License](LICENSE).