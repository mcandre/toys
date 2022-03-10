# sha2: NIST SHA-256 implementation

# WARNING

This is a toy implementation. Do not use this in production. Use a standard implementation.

# EXAMPLE

```console
$ printf "abc" >/tmp/message-short.txt
$ sha2 /tmp/message-short.txt
ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad  /tmp/message-short.txt

$ printf "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq" >/tmp/message-long.txt
$ sha2 /tmp/message-long.txt
248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1  /tmp/message-long.txt

$ rm /tmp/as.txt || :
$ for i in {0..999999}; do printf "a" >>/tmp/as.txt; done
$ sha2 /tmp/as.txt
cdc76e5c9914fb9281a1c7e284d73e67f1809a48a497200e046d39ccc7112cd0  /tmp/as.txt
```

# RUNTIME REQUIREMENTS

(None)

# CONTRIBUTING

For more details on developing args itself, see [DEVELOPMENT.md](DEVELOPMENT.md).

# RESOURCES

https://www.nist.gov/itl/ssd/software-quality-group/nsrl-test-data
