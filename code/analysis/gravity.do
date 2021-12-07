args input_file output_file
log using "`output_file'", replace text
use "`input_file'", clear

generate same_country = (origin_country_code == destination_country_code)

generate ln_distance = ln(distance)
generate ln_value = ln(value)
generate ln_num_tenders = ln(num_tenders)

regress ln_value ln_distance 
regress ln_value ln_distance, robust
regress ln_value ln_distance same_country , robust
regress ln_value ln_distance same_country common_border common_language, robust
