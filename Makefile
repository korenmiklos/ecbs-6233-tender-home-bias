STATA = stata -b do
JULIA = julia --project=.

results/gravity.log: code/analysis/gravity.do data/derived/analysis-sample.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@
data/derived/analysis-sample.dta: code/merge.do data/derived/ted-country-pairs.dta data/clean/geodist/dist_cepii.dta data/clean/country-codes/country-codes.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@
data/derived/ted-country-pairs.dta: code/aggregate.do data/clean/ted/can-2019.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

data/clean/ted/can-2019.csv: code/read/ted.jl data/raw/ted/can-2019.csv
	mkdir -p $(dir $@)
	$(JULIA) $^ $@
data/clean/geodist/dist_cepii.dta: code/read/geodist.do data/raw/geodist/dist_cepii.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@
data/clean/country-codes/country-codes.dta: code/read/country-codes.do data/raw/country-codes/country-codes.csv
	mkdir -p $(dir $@)
	$(STATA) $^ $@

data/raw/country-codes/country-codes.csv:
	mkdir -p $(dir $@)
	curl -Lo $@ "https://datahub.io/core/country-codes/r/country-codes.csv"
data/raw/ted/can-2019.csv: 
	mkdir -p $(dir $@)
	curl -Lo $@ "https://data.europa.eu/euodp/repository/ec/dg-grow/mapps/TED%202020/TED%20-%20Contract%20award%20notices%202019.csv"
data/raw/geodist/dist_cepii.dta: 
	mkdir -p $(dir $@)
	curl -Lo $@ "http://www.cepii.fr/distance/dist_cepii.dta"

install:
	stata -b ssc install wbopendata
