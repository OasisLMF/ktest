# Generate footprint csv file for testing validatefootprint

import numpy as np
import pandas as pd
import csv

def edit_values(df, select_fields, rows, field, increment):

    for selection in rows:
        select_row = dict(zip(select_fields, selection))
        df.loc[
            (df[list(select_row)] == pd.Series(select_row)).all(axis=1),
            field
        ] += increment

    return df

if __name__ == '__main__':

    # Original, good file that bad one shall be derived from
    df = pd.read_csv('../static/footprint.csv')
    kwargs = {
        'index': False,
        'float_format': '%.10e',
        'quoting': csv.QUOTE_NONE
    }
    select_fields = ['event_id', 'areaperil_id', 'intensity_bin_id']

    # Format column names
    column_names = df.columns.tolist()
    column_names = [name.strip(' "') for name in column_names]
    df.columns = column_names

    # Incorporate all issues
    df_all_issues = df.copy()
    # Out of order event IDs
    select_ooo_eventid = [
        [1400202, 300001, 83],
        [2100197, 400001, 57],
        [2100258, 2, 115]
    ]
    df_all_issues = edit_values(
        df_all_issues,
        select_fields,
        select_ooo_eventid,
        'event_id',
        1
    )
    # Out of order areaperil IDs
    select_ooo_areaperilid = [
        [1300265, 100001, 39],
        [1900196, 300001, 12],
        [2000227, 1, 19]
    ]
    df_all_issues = edit_values(
        df_all_issues,
        select_fields,
        select_ooo_areaperilid,
        'areaperil_id',
        1
    )
    # Duplicate intensity bin IDs
    select_dupl_intensitybinid = [
        [1400283, 400002, 88],
        [1500064, 200001, 76],
        [2000311, 1, 53]
    ]
    for selection in select_dupl_intensitybinid:
        select_row = dict(zip(select_fields, selection))
        row = df_all_issues[
            (df_all_issues[list(select_row)] == pd.Series(select_row)).all(axis=1)
        ]
        row_index = row.index.values[0]
        df_all_issues = pd.concat(
            [
                df_all_issues.iloc[:row_index],
                row,
                df_all_issues.iloc[row_index:]
            ]
        )
    # Total probability for event-areaperil combinations does not sum to 1
    select_tot_prob = [
        [198, 1, 3],
        [300023, 1, 15],
        [1400054, 500001, 105]
    ]
    df_all_issues = edit_values(
        df_all_issues,
        select_fields,
        select_tot_prob,
        'probability',
        0.0001
    )
    # Insert invalid data
    missing_data = [
        [262, 1, 44],
        [600246, 300001, 29],
        [1300050, 300001, 90]
    ]
    for selection in missing_data:
        select_row = dict(zip(select_fields, selection))
        row = df_all_issues[
            (df_all_issues[list(select_row)] == pd.Series(select_row)).all(axis=1)
        ]
        row_index = row.index.values[0]
        df_all_issues.loc[row_index, 'probability'] = np.nan
        
    df_all_issues.to_csv('../static/footprint_allissues.csv', **kwargs)
