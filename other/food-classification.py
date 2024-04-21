from transformers import pipeline

# Load the image classification pipeline
classifier = pipeline(
    "image-classification", model="Kaludi/food-category-classification-v2.0"
)

# Path to your image
image_path = "path_to_your_image.jpg"

# Classify the image
results = classifier(image_path)

# Display the predicted class and score
for result in results:
    print(f"Predicted class: {result['label']}, Score: {result['score']}")
