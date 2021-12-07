args input_file output_file

import delimited using "`input_file'", encoding(utf-8) varnames(1) case(preserve) bindquotes(strict) clear

keep ISO31661Alpha3 ISO31661Alpha2 

save "`output_file'", replace