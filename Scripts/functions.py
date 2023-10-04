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
    overall_match = True
    correct_data = [eval(data) for data in correct_data_strings]
    converted = pd.read_excel(file)
    for sheet_name , sheet_data in correct_data:
        if sheet_name in converted:
            sheet_content = converted[sheet_name]
            json_body = sheet_content.to_json(orient="records", force_ascii=False)
            parsed_data = json.loads(json_body)
            match = all(compare_dicts(data, correct_data["data"]) for data in parsed_data)
            overall_match  = overall_match and match
        else:
            overall_match = False
    return overall_match
