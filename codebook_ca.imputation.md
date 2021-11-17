Codebook created on 2021-11-17 at 2021-11-17 15:55:34
================

A codebook contains documentation and metadata describing the contents,
structure, and layout of a data file.

## Dataset description

The data contains 1500 cases and 18
variables.

## Codebook

| name          | type    |    n | missing | unique |  mean | median |    mode | mode\_value |   sd |    v |  min |   max | range | skew | skew\_2se |  kurt | kurt\_2se |
| :------------ | :------ | ---: | ------: | -----: | ----: | -----: | ------: | :---------- | ---: | ---: | ---: | ----: | ----: | ---: | --------: | ----: | --------: |
| ThreatHi      | factor  | 1421 |    0.05 |      3 |       |        |  842.00 | 0           |      | 0.48 |      |       |       |      |           |       |           |
| SamPt         | factor  | 1500 |    0.00 |    168 |       |        |    9.00 | 1           |      | 0.99 |      |       |       |      |           |       |           |
| NetComp       | factor  | 1480 |    0.01 |      6 |       |        |  695.00 | 1           |      | 0.67 |      |       |       |      |           |       |           |
| Gender        | factor  | 1500 |    0.00 |      3 |       |        |  907.00 | Female      |      | 0.48 |      |       |       |      |           |       |           |
| Educ          | numeric | 1500 |    0.00 |     26 | 12.93 |  13.00 |   13.00 |             | 2.96 |      | 5.00 | 49.00 | 44.00 | 2.88 |     22.81 | 25.87 |    102.42 |
| OwnPC         | factor  | 1496 |    0.00 |      3 |       |        |  824.00 | Yes         |      | 0.49 |      |       |       |      |           |       |           |
| UseNet        | factor  | 1476 |    0.02 |      3 |       |        | 1077.00 | Yes         |      | 0.39 |      |       |       |      |           |       |           |
| nextyear\_M   | factor  | 1423 |    0.05 |      4 |       |        |  886.00 | 3           |      | 0.51 |      |       |       |      |           |       |           |
| Statements1   | factor  | 1407 |    0.06 |      5 |       |        |  542.00 | 3           |      | 0.70 |      |       |       |      |           |       |           |
| OpinionPak    | factor  | 1090 |    0.27 |      5 |       |        |  472.00 | 2           |      | 0.67 |      |       |       |      |           |       |           |
| OpinionRussia | factor  | 1460 |    0.03 |      5 |       |        |  759.00 | 4           |      | 0.55 |      |       |       |      |           |       |           |
| CanBuy\_M     | factor  | 1461 |    0.03 |      7 |       |        |  573.00 | 3           |      | 0.74 |      |       |       |      |           |       |           |
| Region\_M     | factor  | 1500 |    0.00 |      8 |       |        |  504.00 | Southern    |      | 0.81 |      |       |       |      |           |       |           |
| TodayEcSit\_M | factor  | 1472 |    0.02 |      6 |       |        |  469.00 | 3           |      | 0.75 |      |       |       |      |           |       |           |
| GeoCode       | factor  | 1500 |    0.00 |      3 |       |        |  779.00 | Urban       |      | 0.50 |      |       |       |      |           |       |           |
| AgeGroup2     | factor  | 1500 |    0.00 |      6 |       |        |  428.00 | 1           |      | 0.78 |      |       |       |      |           |       |           |
| TrustGov\_M   | factor  | 1452 |    0.03 |      3 |       |        | 1300.00 | Trust       |      | 0.19 |      |       |       |      |           |       |           |
| totwt         | numeric | 1500 |    0.00 |    118 |  1.00 |   0.96 |    0.96 |             | 0.32 |      | 0.34 |  2.46 |  2.12 | 0.84 |      6.68 |  1.42 |      5.64 |

### Legend

  - **Name**: Variable name
  - **type**: Data type of the variable
  - **missing**: Proportion of missing values for this variable
  - **unique**: Number of unique values
  - **mean**: Mean value
  - **median**: Median value
  - **mode**: Most common value (for categorical variables, this shows
    the frequency of the most common category)
  - **mode\_value**: For categorical variables, the value of the most
    common category
  - **sd**: Standard deviation (measure of dispersion for numerical
    variables
  - **v**: Agresti’s V (measure of dispersion for categorical variables)
  - **min**: Minimum value
  - **max**: Maximum value
  - **range**: Range between minimum and maximum value
  - **skew**: Skewness of the variable
  - **skew\_2se**: Skewness of the variable divided by 2\*SE of the
    skewness. If this is greater than abs(1), skewness is significant
  - **kurt**: Kurtosis (peakedness) of the variable
  - **kurt\_2se**: Kurtosis of the variable divided by 2\*SE of the
    kurtosis. If this is greater than abs(1), kurtosis is significant.

This codebook was generated using the [Workflow for Open Reproducible
Code in Science (WORCS)](https://osf.io/zcvbs/)
