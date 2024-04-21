import requests

query = "italian wedding soup"
api_url = "https://api.api-ninjas.com/v1/recipe?query={}".format(query)
response = requests.get(
    api_url, headers={"X-Api-Key": "OJewtFANzlfkKxigES051w==6KQp66KOaQj2uPP7"}
)
if response.status_code == requests.codes.ok:
    print(response.text)
else:
    print("Error:", response.status_code, response.text)
