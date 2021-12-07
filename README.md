
# Home Bias in Public Procurement
## 2021-12-07


## Authors

- [Miklós Koren](https://koren.mk)


# Data availability and provenance statements
### Statement about rights

The author(s) of the manuscript have legitimate access to and permission to use the data used in this manuscript.

### Summary of availability
- All data **are** publicly available.

### Details on each data source

All source data are available publicly with a permissive license. The `Makefile` lists the URLs from which they can be downloaded.

# Dataset list

| Data file | Source | License |
|-----------|--------|----------|
| `data/raw/ted/can-2019.csv` | European Commission (2015) | https://data.europa.eu/en/legal-notice |
| `data/raw/geodist/dist_cepii.dta` | CEPII (2011) | https://www.etalab.gouv.fr/licence-ouverte-open-licence |
| `data/raw/country-codes/country-codes.csv` | Data Hub (2021) | https://opendatacommons.org/licenses/pddl/ |



# Description of programs/code

The project uses GNU Make. To install dependencies, run `make install` from the root of the project folder. To do all data cleaning and analysis steps, run `make`.

- Programs in `code/read` will extract and reformat all datasets referenced above.
- The script `code/aggregate.do` aggregates Tenders Electronic Daily data to country pairs.
- The script `code/merge.do` merges the three cleaned datasets.
- Programs in `code/analysis` run the analysis.

### License for Code

The code is licensed under a MIT license. See [LICENSE](LICENSE) for details.


# References

- European Commission, 2015. "Tenders Electronic Daily (TED) (csv subset) – public procurement notices [data set]." Available at: http://data.europa.eu/88u/dataset/ted-csv Last accessed November 30, 2021].
- Mayer, T. & Zignago, S. 2011. "Notes on CEPII’s distances measures: the GeoDist Database." CEPII Working Paper 2011-25
- Centre d’études prospectives et d’informations internationales. 2011. "GeoDist [data set]." Available at http://www.cepii.fr/cepii/en/bdd_modele/download.asp?id=6. Last accessed on 2021-12-07.
- Data Hub. 2021. "Comprehensive country codes: ISO 3166, ITU, ISO 4217 currency codes and many more [data set]" Available at https://datahub.io/core/country-codes Last accessed on 2021-12-07.

