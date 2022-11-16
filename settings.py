# !mkdir -p $OUTPUT_DIR
import os

# Set up env vars
HUGGINGFACE_TOKEN = os.getenv('HUGGINGFACE_TOKEN')
MODEL_NAME = os.getenv('MODEL_NAME')
OUTPUT_DIR = os.getenv('OUTPUT_DIR')
INSTANCE = os.getenv('INSTANCE')
CLASS = os.getenv('CLASS')

# You can also add multiple concepts here. Try tweaking `--max_train_steps` accordingly.
data_dir = "/content/data/"
concepts_list = [
    {
        "instance_prompt":      f"photo of {INSTANCE} {CLASS}",
        "class_prompt":         f"photo of a {CLASS}",
        "instance_data_dir":    f"{data_dir}/{INSTANCE}",
        "class_data_dir":       f"{data_dir}/{CLASS}"
    },
    # Can be more than one.
]

# `class_data_dir` contains regularization images
import json
import os
for c in concepts_list:
    os.makedirs(c["instance_data_dir"], exist_ok=True)

with open("concepts_list.json", "w") as f:
    json.dump(concepts_list, f, indent=4)
