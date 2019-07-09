# Generate damage_bin_dict csv files for testing damagebintobin

import pandas as pd
import csv

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
for b in swap_bins:
    b1, b2 = df_noncont_binid.iloc[b[0]].copy(), df_noncont_binid.iloc[b[1]].copy()
    df_noncont_binid.iloc[b[0]], df_noncont_binid.iloc[b[1]] = b2, b1
df_noncont_binid['"bin_index"'] = df_noncont_binid['"bin_index"'].astype(int)
df_noncont_binid.to_csv('../static/damage_bin_dict_noncont.csv', **kwargs)

# Interpolation damage values outside range
df_idvxrange = df.copy()
idvxrange_bins = [23, 64, 92]
for b in idvxrange_bins:
    df_idvxrange.loc[b, '"interpolation"'] = df_idvxrange.loc[b, '"interpolation"'] + df_idvxrange.loc[b, '"bin_to"'] - df_idvxrange.loc[b, '"bin_from"']
df_idvxrange.to_csv('../static/damage_bin_dict_idvxrange.csv', **kwargs)

# Lower limit for first bin != 0
# Upper limit for last bin != 1
df_bad_bin_limits = df.copy()
df_bad_bin_limits.iloc[0, 1:4] = 0.001
df_bad_bin_limits.iloc[1, 1] = 0.001
df_bad_bin_limits.iloc[-1, 1:4] = 0.999
df_bad_bin_limits.iloc[-2, 2] = 0.999
df_bad_bin_limits.to_csv('../static/damage_bin_dict_badbinlim.csv', **kwargs)
