import os
import zipfile
import requests
from dotenv import load_dotenv

# Get the directory where the script is located
script_dir = os.path.dirname(os.path.realpath(__file__))

# Read the IP2Location environment variables
print("Reading IP2Location environment variables...")
load_dotenv()
IP_2_LOCATION_TOKEN = os.getenv("IP_2_LOCATION_TOKEN")
print("IP2Location environment variables read.")

# Download the IP2Location database
print("Downloading IP2Location database...")
url = (
    f"https://www.ip2location.com/download/?token={IP_2_LOCATION_TOKEN}&file=DB9LITECSV"
)
response = requests.get(url)

if response.status_code == 200:
    # Save the downloaded content to a file
    with open(f"{script_dir}/IP2LOCATION-LITE-DB9.CSV.ZIP", "wb") as zip_file:
        zip_file.write(response.content)
    print("Download complete.")

    # Unzip the database
    print("Unzipping IP2Location database...")
    try:
        with zipfile.ZipFile(
            f"{script_dir}/IP2LOCATION-LITE-DB9.CSV.ZIP", "r"
        ) as zip_ref:
            zip_ref.extractall(script_dir)
        print("Unzip complete.")
    except zipfile.BadZipFile:
        raise Exception("Error unzipping IP2Location database. Bad zip file.")
else:
    raise Exception(
        f"Error downloading IP2Location database. Status code: {response.status_code}"
    )
