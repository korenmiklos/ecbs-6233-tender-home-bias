using DataFrames, DataFramesMeta
using CSV, StatFiles, FileIO
import Base: occursin

# handle missing values
convert_missing_string = (x -> x == missing ? "" : x)

input_filename, output_filename = ARGS
ted_df = CSV.read(input_filename, DataFrame)
@chain ted_df begin
    # only keep countries and values
    @select :ID_NOTICE_CAN :ISO_COUNTRY_CODE :VALUE_EURO :WIN_COUNTRY_CODE
    @rtransform(:ISO_COUNTRY_CODE => convert_missing_string => :ISO_COUNTRY_CODE)
    @rtransform(:WIN_COUNTRY_CODE => convert_missing_string => :WIN_COUNTRY_CODE)
    # drop tenders with multiple buyers
    @rsubset !occursin("---", :ISO_COUNTRY_CODE)
    # drop tenders with multiple winners
    @rsubset !occursin("---", :WIN_COUNTRY_CODE)
    save(output_filename, _)
end
