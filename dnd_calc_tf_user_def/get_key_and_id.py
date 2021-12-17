import json
import gnupg
import base64
import sys

# invoke via `terraform output -json | python3 get_key_and_id.py`
# prints the decrypted id & key for the newly created admin account
# that way its easy to add as a named profile in the aws cli
if __name__ == "__main__":
    data = json.loads(sys.stdin.read())
    id = data['admin_id']['value']
    key = base64.b64decode(data['admin_encrypted_key']['value'])
    gpg = gnupg.GPG()
    key = gpg.decrypt(key)
    print(f'id: {id}')
    print(f'key: {key}')
    