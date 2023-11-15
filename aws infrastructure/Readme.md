# aws-free-tier-infrastructure


## create key pair

    1. ssh-keygen -t rsa -b 4096 -C "" -f "$HOME/.ssh/my-key-pair" -N ""
    2. sudo cp "$HOME/.ssh/my-key-pair" "$HOME/.ssh/my-key-pair.pem"
    3. cd modules/key_pair
    4. tf init
    5. tf apply

## create infrastructure

    ```
    1. cd infrastructure
    ```
    ```
    2. tf init
    ```
    ```
    3. tf plan
    ```
    ```
    3. tf apply
    ```
    ```
    tf destroy
    ```
    ```
    tf fmt
    ```
