import cv2
import numpy as np


def colorize_edges(image):
    # Convert image to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Detect edges using Canny edge detector
    edges = cv2.Canny(gray, 50, 150)

    # Convert edges to BGR color space
    edges_color = cv2.cvtColor(edges, cv2.COLOR_GRAY2BGR)

    # Create a mask for the edges
    mask = np.zeros_like(image)
    mask[edges != 0] = [255, 255, 255]

    # Colorize the edges
    colorized_edges = cv2.bitwise_and(edges_color, mask)

    # Combine the original image and the colorized edges
    colorized_image = cv2.addWeighted(image, 0.8, colorized_edges, 1, 0)

    return colorized_image


# Load the image
image_path = "banana1.jpeg"
image = cv2.imread(image_path)

# Apply edge detection and colorization
colorized_image = colorize_edges(image)

# Save the image
output_path = "colorized_edges.jpg"
cv2.imwrite(output_path, colorized_image)
