import pandas as pd
import pyodbc
from sqlalchemy import create_engine

#Read excel file
def import_data(file_path, table_name):
    excel_data = pd.read_excel(file_path)

    # Database connection parameters
    server = 'DESKTOP-8G92QBP\HUI'
    database = 'PortfolioProject'
    username = 'sa'
    password = 'yh903027'

    try:
        # Establishing a connection
        connection_string = f'mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server' 
        engine = create_engine(connection_string)
        engine.dispose()

    
        # Import data into SQL Server
        result = excel_data.to_sql(table_name, con=engine, if_exists='replace', index=False)

        return result

    except pyodbc.Error as e:
        print("Database error:", e)
        # Optionally, add any rollback or specific error handling here

    except Exception as e:
        print("An error occurred:", e)
        # Handle any other exceptions

import_data(r"C:\Users\yangh\Downloads\CovidVaccinations.xlsx", "CovidVaccinations")
