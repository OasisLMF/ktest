# Generate damage_bin_dict csv files for testing validatedamagebin

import numpy as np
import pandas as pd
import csv

def swap_rows(df, bins):

    # Non-contiguous bin indices
    for b in bins:
        b1, b2 = df.iloc[b[0]].copy(), df.iloc[b[1]].copy()
        df.iloc[b[0]], df.iloc[b[1]] = b2, b1
    df['"bin_index"'] = df['"bin_index"'].astype(int)
    df['"interval_type"'] = df['"interval_type"'].astype(int)

    return df

def change_interpolation_damage_values(df, bins):

    # Interpolation damage values lie outside bin range
    for b in bins:
        df.loc[b, '"interpolation"'] = df.loc[b, '"interpolation"'] + df.loc[b, '"bin_to"'] - df.loc[b, '"bin_from"']

    return df

def change_first_and_last_bin_limits(df):

    # Lower limit for first bin != 0
    df.iloc[0, 1:4] = 0.001
    df.iloc[1, 1] = 0.001
    # Upper limit for last bin != 1
    df.iloc[-1, 1:4] = 0.999
    df.iloc[-2, 2] = 0.999

    return df

def insert_nans(df, locations):

    # Missing data
    for location in locations:
        df.loc[location[0], location[1]] = np.nan

    return df

if __name__ == '__main__':

    # Original, good file that other, bad ones are derived from
    df = pd.read_csv('../static/damage_bin_dict.csv')
    kwargs = {'index': False, 'float_format': '%.6f', 'quoting': csv.QUOTE_NONE}

    # Format column names
    column_names = df.columns.tolist()
    column_names = [name.strip(' "') for name in column_names]
    column_names = ['"' + name + '"' for name in column_names]
    df.columns = column_names

    # First bin index != 1
    df_first_bin_ne_1 = df.copy()
    df_first_bin_ne_1['"bin_index"'] += 1
    df_first_bin_ne_1.to_csv('../static/damage_bin_dict_1stbinne1.csv', **kwargs)

    # Non-contiguous bin indices
    df_noncont_binid = df.copy()
    swap_bins = [ [30, 31], [45, 46], [74, 75] ]
    df_noncont_binid = swap_rows(df_noncont_binid, swap_bins)
    df_noncont_binid.to_csv('../static/damage_bin_dict_noncont.csv', **kwargs)

    # Interpolation damage values outside range
    df_idvxrange = df.copy()
    idvxrange_bins = [23, 64, 92]
    df_idvxrange = change_interpolation_damage_values(df_idvxrange, idvxrange_bins)
    df_idvxrange.to_csv('../static/damage_bin_dict_idvxrange.csv', **kwargs)

    # Lower limit for first bin != 0
    # Upper limit for last bin != 1
    df_bad_bin_limits = df.copy()
    df_bad_bin_limits = change_first_and_last_bin_limits(df_bad_bin_limits)
    df_bad_bin_limits.to_csv('../static/damage_bin_dict_badbinlim.csv', **kwargs)

    # Missing data
    df_missing_data = df.copy()
    missing_data_locations = [ [4, '"bin_from"'], [44, '"bin_to"'] ]
    df_missing_data = insert_nans(df_missing_data, missing_data_locations)
    df_missing_data.to_csv('../static/damage_bin_dict_missingdata.csv', **kwargs)

    # Incorporate all aforementioned issues
    df_all_issues = df.copy()
    df_all_issues['"bin_index"'] += 1   # First bin index != 1
    # Non-contiguous bin indices
    swap_bins_all_issues = [ [19, 20], [61, 62] ]
    df_all_issues = swap_rows(df_all_issues, swap_bins_all_issues)
    # Interpolation damage values outside range
    idvxrange_bins_all_issues = [5, 79, 95]
    df_all_issues = change_interpolation_damage_values(
        df_all_issues,
        idvxrange_bins_all_issues
    )
    # Lower limit for first bin != 0 and upper limit for last bin != 1
    df_all_issues = change_first_and_last_bin_limits(df_all_issues)
    # Insert invalid data
    missing_data_locations_all_issues = [ [53, '"bin_from"'], [58, '"bin_to"'] ]
    df_all_issues = insert_nans(df_all_issues, missing_data_locations_all_issues)
    df_all_issues.to_csv('../static/damage_bin_dict_allissues.csv', **kwargs)

    # Remove deprecated interval_type column from all issues dataframe
    df_all_issues = df_all_issues.drop(['"interval_type"'], axis=1)
    df_all_issues.to_csv(
        '../static/damage_bin_dict_allissues_newformat.csv', **kwargs
    )

    # Remove deprecated interval_type column from original, good file
    df = df.drop(['"interval_type"'], axis=1)
    df.to_csv('../static/damage_bin_dict_newformat.csv', **kwargs)

    # Empty file
    df = pd.DataFrame(columns = df.columns)
    df.to_csv('../static/damage_bin_dict_empty.csv', **kwargs)
