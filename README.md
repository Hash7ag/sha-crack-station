# SHA Crack Station
An SHA crack station coded by Swift for homework delivery purposes.

It shows how to crack passwords easily if the password is too short. Hopefully, it can improve general people's cybersecurity awareness.

## Feature
- Use the pre-generated dictionary to crack SHA-1 and SHA-256, which plaintext matches `^[A-Za-z0-9?!]{1,3}$`.

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