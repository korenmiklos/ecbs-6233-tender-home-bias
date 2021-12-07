STATA = stata -b do
data/clean/ted/can-2019.dta: code/read/ted.do data/raw/ted/can-2019.csv
	$(STATA) $^ $@
data/raw/ted/can-2019.csv: 
	curl -Lo $@ "https://data.europa.eu/euodp/repository/ec/dg-grow/mapps/TED%202020/TED%20-%20Contract%20award%20notices%202019.csv"



data/clean/geodist/dist_cepii.dta: code/read/geodist.do data/raw/geodist/dist_cepii.dta
	$(STATA) $^ $@
data/raw/geodist/dist_cepii.dta: 
	curl -Lo $@ "http://www.cepii.fr/distance/dist_cepii.dta"