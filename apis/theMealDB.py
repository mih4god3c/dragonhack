import requests

api_url = "https://www.themealdb.com/api/json/v1/1/search.php?f=a"
response = requests.get(api_url)

print(response.text)
