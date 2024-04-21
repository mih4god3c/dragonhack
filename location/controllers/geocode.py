import pandas as pd
from typing import Tuple


def geocode(database: pd.DataFrame, ip_address: str) -> Tuple[float, float]:
    """
    Convert an IP address to geographic coordinates (latitude and longitude).

    Args:
        database (DataFrame): IP2Location database
        ip_address (str): IP address to geocode.

    Returns:
        Tuple[float, float]: The latitude and longitude of the IP address.
    """
    # Convert the IP address to integer
    ip_address = int(ip_address.replace(".", ""))

    # Find the group where the IP address belongs
    group = database[
        (database["ip_address_start"] <= ip_address)
        & (database["ip_address_end"] >= ip_address)
    ]

    # If the IP address is not found in the database, return default values
    if len(group) == 0:
        return 0.0, 0.0

    # Get the latitude and longitude of the IP address
    latitude = group["ip_address_latitude"].values[0]
    longitude = group["ip_address_longitude"].values[0]

    # Return the latitude and longitude
    return latitude, longitude
