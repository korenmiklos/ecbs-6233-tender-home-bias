args input_file output_file

use "`input_file'", clear

collapse (sum) value = VALUE_EURO (count) num_tenders = VALUE_EURO, by(ISO_COUNTRY_CODE WIN_COUNTRY_CODE)

save "`output_file'", replace