import os
import openai

TOKEN = os.environ["API_TOKEN"]
BASE_URL = "https://openai-proxy.sellestial.com/api"


def main():
    """
    Main function
    """

    # OpenAI docs: https://platform.openai.com/docs/guides/text-generation

    client = openai.OpenAI(api_key=TOKEN, base_url=BASE_URL)

    model = "gpt-3.5-turbo"  # also available: "gpt-4-turbo"
    messages = [
        {
            "role": "system",
            "content": "You are a helpful assistant.",
        },
    ]
    while True:
        user_message = input("You:\n")
        print("---")
        messages.append(
            {
                "role": "user",
                "content": user_message,
            }
        )

        response = client.chat.completions.create(
            model=model,
            messages=messages,
        )

        ai_content = response.choices[0].message.content
        print("AI:")
        print(ai_content)
        print("---")
        messages.append(
            {
                "role": "assistant",
                "content": ai_content,
            }
        )


if __name__ == "__main__":
    main()
