import json
import gnupg
import base64

# prints the decrypted id & key for the newly created admin account once its in your .tfstate
# that way its easy to add as a named profile in the aws cli
if __name__ == "__main__":
    with open("./terraform.tfstate", "r") as file:
        data = json.loads(file.read())
        id = data.get('resources', [])[0].get('instances', [])[0].get('attributes', {}).get('id', None)
        key = data.get('resources', [])[0].get('instances', [])[0].get('attributes', {}).get('encrypted_secret', None)
    key = base64.b64decode(key)
    gpg = gnupg.GPG()
    key = gpg.decrypt(key)
    print(f'id: {id}')
    print(f'key: {key}')
    