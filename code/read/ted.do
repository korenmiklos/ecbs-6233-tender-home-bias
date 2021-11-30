local input_file `1'
local output_file `2'
/*
same as
args input_file output_file
*/
import delimited using "`input_file'", encoding(utf-8) varnames(1) case(preserve) clear

* only keep countries and values
keep ID_NOTICE_CAN ISO_COUNTRY_CODE VALUE_EURO WIN_COUNTRY_CODE

* drop tenders with multiple buyers
drop if strpos(ISO_COUNTRY_CODE, "---")
* drop tenders with multiple winners
drop if strpos(WIN_COUNTRY_CODE, "---")

save "`output_file'", replace