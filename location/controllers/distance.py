import math


def calculate_distance(
    latitude1: float, longitude1: float, latitude2: float, longitude2: float
) -> float:
    """
    Calculate the distance between two points using the Haversine formula.

    Args:
        latitude1 (float): The latitude of the first point.
        longitude1 (float): The longitude of the first point.
        latitude2 (float): The latitude of the second point.
        longitude2 (float): The longitude of the second point.

    Returns:
        float: The distance between the two points in kilometers.
    """
    # Convert latitude and longitude to spherical coordinates in radians
    degrees_to_radians = math.pi / 180.0

    # phi = 90 - latitude
    phi1 = (90.0 - latitude1) * degrees_to_radians
    phi2 = (90.0 - latitude2) * degrees_to_radians

    # theta = longitude
    theta1 = longitude1 * degrees_to_radians
    theta2 = longitude2 * degrees_to_radians

    # Compute spherical distance from spherical coordinates
    cos = math.sin(phi1) * math.sin(phi2) * math.cos(theta1 - theta2) + math.cos(
        phi1
    ) * math.cos(phi2)
    arc = math.acos(cos)

    # Multiply arc by the radius of the earth to get distance in kilometers
    return arc * 6371.0
