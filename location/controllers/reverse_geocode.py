import pandas as pd
from controllers.distance import calculate_distance


def reverse_geocode(database: pd.DataFrame, latitude: float, longitude: float) -> str:
    """
    Convert geographic coordinates (latitude and longitude) to an IP address.

    Args:
        database (DataFrame): IP2Location database
        latitude (float): Latitude to reverse geocode.
        longitude (float): Longitude to reverse geocode.

    Returns:
        str: The IP address of the geographic coordinates.
    """
    # Find the group where the latitude and longitude belongs the nearest based on the distance
    group = database.loc[
        database.apply(
            lambda row: calculate_distance(
                latitude,
                longitude,
                row["ip_address_latitude"],
                row["ip_address_longitude"],
            ),
            axis=1,
        ).idxmin()
    ]

    # Get the start and end IP address of the group and calculate its midpoint
    ip_address_start = group["ip_address_start"]
    ip_address_end = group["ip_address_end"]
    ip_address = (ip_address_start + ip_address_end) // 2

    # Convert the IP address to string separated by dots
    ip_address = ".".join(
        [
            str((ip_address >> 24) & 255),
            str((ip_address >> 16) & 255),
            str((ip_address >> 8) & 255),
            str(ip_address & 255),
        ]
    )

    # Return the IP address
    return ip_address
