import pandas as pd
import pyodbc
from sqlalchemy import create_engine

#Read excel file
excel_data = pd.read_excel(r'C:\Users\yangh\Downloads\CovidDeaths.xlsx')

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
    table_name = 'CovidDeaths'
    excel_data.to_sql(table_name, con=engine, if_exists='replace', index=False)

   

except pyodbc.Error as e:
    print("Database error:", e)
    # Optionally, add any rollback or specific error handling here

except Exception as e:
    print("An error occurred:", e)
    # Handle any other exceptions

