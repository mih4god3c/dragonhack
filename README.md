# DragonHack 2024

## Team: Hladilniki

### Project WasteWise

### Members

- Gašper Funda
- Miha Godec
- Rok Mokotar
- Vid Potočnik

## Link to the mobile app

[https://we.tl/t-UmN0QYkXPK](https://we.tl/t-UmN0QYkXPK)

## Link to the dashboard

[https://caaa120f-80a7-4012-89bf-5049ccfa6b8b-staging.weweb-preview.io/](https://caaa120f-80a7-4012-89bf-5049ccfa6b8b-staging.weweb-preview.io/)

## About

The application solves the problem of zero food waste. In short, it solves two main problems:

- helps you find the best recipe you would usually throw away
- helps you keep an eye on your inventory and reminds you for the food items that are about to expire

### How it works

Users can simply take a picture of the food item, and the application will, with the use of AI, recognize the food item and suggest the best recipes for it. Because your hands are busy while cooking, the app can read recipes for you. Users can also check recipes from our large database.

The application also features a function to keep track of the food items in your home. You can simply add new food items by taking a picture of them, scanning the receipt from the store, scanning the QR/EAN code, (and in the future, using NFC tags and RFID) or manually adding them. The application will then remind you when the food item is about to expire.

In the application, you can also create your own shopping lists and add them to your calendar or send them via SMS. With this feature, you can optimize your visits to the store to the fullest.

Meal plans are essential to staying organized and using everything you have without wasting it. The application will suggest the best meal plan for the week based on the food items you have at home.

Since we love challenges, the app also encourages you to take part in challenges and earn points for every food item you save from being thrown away.

And yes, as in every modern app, there's an AI chatbot that can help you with any questions you have.

Since we have a bit more time, we have also prepared a simple dashboard if you prefer using a computer.

_Sorry for the long description :D_

## APIs used

- [Text2Speech](https://platform.openai.com/docs/guides/text-to-speech)
- [ChatGPT-4](https://platform.openai.com/docs/api-reference/introduction)
- [Food recognition I](https://huggingface.co/nateraw/food)
- [Food recognition II](https://huggingface.co/Kaludi/food-category-classification-v2.0)
- EAN reader
- QR reader
- [Google Calendar](https://developers.google.com/calendar/api/guides/overview)
- [SMS](https://developer.android.com/reference/android/telephony/SmsManager)
- [Recipes I](https://api-ninjas.com/api/recipe)
- [Recipes II](https://www.themealdb.com/api.php)
- [Recipes III](https://spoonacular.com/food-api/docs)
- [OneSignal](https://documentation.onesignal.com/docs/onesignal-api)
- [Supabase](https://supabase.com/)

## Mobile functionality

- [x] Onboarding
- [x] Authentication with OAuth
- [x] Dashboard with statistics about your waste
- [x] Snap food item and find a recipe for it or add it the your inventory
- [x] Cook recipes with help of an AI
- [x] Monitoring your inventory
- [x] Push notifications for expiration dates
- [x] Shopping list
- [x] Recipes with multiple filters
- [x] Meal planning
- [x] Weekly challenges
- [x] Personal assistant

## Web functionality

- [x] Dashboard with statistics, recipes and shopping list
