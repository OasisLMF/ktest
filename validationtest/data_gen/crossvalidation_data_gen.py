# Generate damage bin dict and vulnerability files for testing crossvalidation

import pandas as pd
import csv

if __name__ == '__main__':

    # Original, good damage bin dict file that bad one shall be derived from
    df = pd.read_csv('../static/damage_bin_dict.csv')
    kwargs = {'index': False, 'float_format': '%.6f', 'quoting': csv.QUOTE_NONE}

    # Format column names
    column_names = df.columns.tolist()
    column_names = [name.strip(' "') for name in column_names]
    column_names = ['"' + name + '"' for name in column_names]
    df.columns = column_names

    # Drop last damage bin ID
    df = df.iloc[0:-1]
    df.to_csv('../static/damage_bin_dict_crosscheckfail.csv', **kwargs)

    # Original, good vulnerability file that bad one shall be derived from
    df = pd.read_csv('../static/vulnerability.csv')
    kwargs = {
        'index': False,
        'float_format': '%.10e',
        'quoting': csv.QUOTE_NONE
    }

    # Format column names
    column_names = df.columns.tolist()
    column_names = [name.strip(' "') for name in column_names]
    df.columns = column_names

    # Drop rows with maximum intensity bin ID
    df = df[df['intensity_bin_id'] != df['intensity_bin_id'].max()]
    df.to_csv('../static/vulnerability_crosscheckfail.csv', **kwargs)
