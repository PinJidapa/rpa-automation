import pandas as pd
import os
import json


assets_path = "assets/"


def compare_dicts(dict1, dict2):
    for key, value in dict1.items():
        if key in dict2 and dict2[key] == value:
            continue
        else:
            return False
    return True


def main():
    # get files from assets folder
    files = os.listdir(assets_path)
    # get only xlsx files
    excel_files = [file for file in files if file.endswith(".xlsx")]
    # read excel files
    for file in excel_files:

        # 1 - Bank book
        converted = pd.read_excel(assets_path + file)
        json_body = converted.to_json(orient="records")
        parsed_data = json.loads(json_body)

        correct_data = [{
            "ชื่อบัญชี": ";>?Thนภ-_-1234$#",
            "เลขที่บัญชี": "962-240326-4",
            "ชื่อธนาคาร (อังกฤษ)": "Siam Commercial Bank",
            "ชื่อธนาคาร (ไทย)": "ธนาคารไทยพาณิชย์",
            "สาขา": "0962 สาขาเทสโก้ โลตัส บ้านแพ้ว",
            "ชื่อธนาคาร": "Thปิ่น-_-1234$#;>?",
        }]

        match = all(compare_dicts(
            data, correct_data[0]) for data in parsed_data)
        if match:
            print("Correct data")
        else:
            print("Incorrect data")

    pass


if __name__ == "__main__":
    main()
