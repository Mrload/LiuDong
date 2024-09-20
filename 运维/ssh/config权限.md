
| Path                                 | Permission        |
| ------------------------------------ | ----------------- |
| .ssh directory                       | 0700 (drwx------) |
| private keys (ex: `id_rsa`)          | 0600 (-rw-------) |
| `config`                             | 0600 (-rw-------) |
| public keys (*.pub ex: `id_rsa.pub`) | 0644 (-rw-r--r--) |
| `authorized_keys`                    | 0644 (-rw-r--r--) |
| `known_hosts`                        | 0644 (-rw-r--r--) |
# config权限错误

```bash
Bad owner or permissions on /data/users/yuncoder06/.ssh/config
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.

```

```bash
chmod 600 ~/.ssh/config
```

