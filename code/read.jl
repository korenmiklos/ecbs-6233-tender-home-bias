using DataFrames, DataFramesMeta
using CSV, StatFiles, FileIO

input_filename = "data/raw/ted/can-2019.csv"
output_filename = "data/clean/ted/can-2019.csv"

ted_df = CSV.read(input_filename, DataFrame)

@chain ted_df begin
    # only keep countries and values
    @select :ID_NOTICE_CAN :ISO_COUNTRY_CODE :VALUE_EURO :WIN_COUNTRY_CODE
    dropmissing
    # drop tenders with multiple buyers
    @rsubset !occursin("---", :ISO_COUNTRY_CODE)
    # drop tenders with multiple winners
    @rsubset !occursin("---", :WIN_COUNTRY_CODE)
    save(output_filename, _)
end
