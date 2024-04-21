# from google.oauth2 import service_account
# import googleapiclient.discovery

# # Path to your service account credentials JSON file
# SERVICE_ACCOUNT_FILE = "path/to/your/service-account.json"

# # ID of the Google Calendar you want to add the task to
# CALENDAR_ID = "your-calendar-id@group.calendar.google.com"


# # Function to authenticate and create a service to interact with the Google Calendar API
# def create_calendar_service():
#     credentials = service_account.Credentials.from_service_account_file(
#         SERVICE_ACCOUNT_FILE, scopes=["https://www.googleapis.com/auth/calendar"]
#     )
#     service = googleapiclient.discovery.build("calendar", "v3", credentials=credentials)
#     return service


# # Function to create a task on Google Calendar
# def create_task(summary, description="", due_date=None):
#     service = create_calendar_service()

#     event = {
#         "summary": summary,
#         "description": description,
#         "start": {},
#         "end": {},
#         "reminders": {
#             "useDefault": False,
#             "overrides": [
#                 {"method": "popup", "minutes": 10},
#             ],
#         },
#     }

#     if due_date:
#         event["start"]["date"] = due_date
#         event["end"]["date"] = due_date
#     else:
#         event["start"]["dateTime"] = ("2024-04-20T09:00:00",)
#         event["end"]["dateTime"] = ("2024-04-20T10:00:00",)

#     created_event = (
#         service.events().insert(calendarId=CALENDAR_ID, body=event).execute()
#     )
#     print("Task created:", created_event.get("htmlLink"))


# # Example usage
# create_task(
#     summary="Complete project",
#     description="Finish the coding assignment",
#     due_date="2024-04-21",
# )
