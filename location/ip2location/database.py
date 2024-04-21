import os
import pandas as pd


def load_database() -> pd.DataFrame:
    """Loads the IP2Location database into a pandas DataFrame.

    Returns:
        pd.DataFrame: The IP2Location database as a pandas DataFrame.
    """
    print("Loading IP2Location database...")
    # Get the directory where the script is located
    script_dir = os.path.dirname(os.path.realpath(__file__))

    # Define the column names
    column_names = [
        "ip_address_start",
        "ip_address_end",
        "ip_address_country_code",
        "ip_address_country",
        "ip_address_state",
        "ip_address_city",
        "ip_address_latitude",
        "ip_address_longitude",
        "ip_address_zipcode",
        # "ip_address_timezone",
    ]

    # Specify the path to the CSV file
    csv_file_path = f"{script_dir}/IP2LOCATION-LITE-DB9.CSV"

    # Load the IP2Location database and save it to the pandas dataframe
    database = pd.read_csv(csv_file_path, low_memory=True)
    database.columns = column_names
    print("IP2Location database loaded.")

    return database


if __name__ == "__main__":
    database = load_database()
    print(database.head())
