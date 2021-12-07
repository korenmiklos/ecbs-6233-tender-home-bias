args ted geodist codes output_file

use "`ted'", clear
generate ISO31661Alpha2 = WIN_COUNTRY_CODE
merge m:1 ISO31661Alpha2 using "`codes'", keep(master match) nogen
rename ISO31661Alpha3 origin_country_code

replace ISO31661Alpha2 = ISO_COUNTRY_CODE
merge m:1 ISO31661Alpha2 using "`codes'", keep(master match) nogen
rename ISO31661Alpha3 destination_country_code

merge m:1 origin_country_code destination_country_code using "`geodist'", keep(match) nogen

drop ISO31661Alpha2 WIN_COUNTRY_CODE ISO_COUNTRY_CODE
save "`output_file'", replace