args input_file output_file

use "`input_file'", clear

keep iso_o iso_d contig comlang_off colony distw
rename iso_o origin_country_code
rename iso_d destination_country_code
rename contig common_border
rename comlang_off common_language
rename distw distance

save "`output_file'", replace