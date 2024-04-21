import requests

api_url = "https://api.spoonacular.com/recipes/complexSearch?apiKey=adc29959c24c4aef91f02c221ad5089e"
response = requests.get(api_url)

print(response.text)
