import pandas as pd
import os
import json

assets_path = '../assets/'

log_filename = 'comparison_logs.txt'

def compare_dicts(dict1, dict2):
    for key, value in dict1.items():
        if key in dict2:
            if dict2[key] is None and value is None:
                continue  # Both values are None (null)
            elif dict2[key] == value:
                continue  # Values match
        return False
    return True

def compare(correct_data_strings, file):
    # Convert correct_data_strings to actual dictionaries
    correct_data = [eval(data) for data in correct_data_strings]
    converted = pd.read_excel(file)
    json_body = converted.to_json(orient="records", force_ascii=False)  # Disable ASCII encoding for non-ASCII characters
    parsed_data = json.loads(json_body)
    match = all(compare_dicts(data, correct_data[0]) for data in parsed_data)
    return match
