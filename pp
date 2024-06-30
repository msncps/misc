Measure_MaxDate = CALCULATE(MAX('GP' [Date]), REMOVEFILTERS('GP' [Date]))
Measure_SecondLatestDate = CALCULATE(MAX('GP' [Date]), FILTER(ALL('GP'), 'GP' [Date] < [Measure_MaxDate]))
Measure_PriceOnMaxDate = CALCULATE(MAX('GP' [Close Price]), FILTER(ALL('GP'), 'GP' [Date] = [Measure_MaxDate]))
Measure_PriceOnSecondLatestDate = CALCULATE(MAX('GP' [Close Price]), FILTER(ALL('GP'), 'GP' [Date] = [Measure_SecondLatestDate]))
Measure_AdjustedPriceOnSecondLatestDate = [Measure_PriceOnSecondLatestDate] / 5
Measure_PriceDifference = [Measure_PriceOnMaxDate] - [Measure_AdjustedPriceOnSecondLatestDate]
Measure_PercentPriceDifference = DIVIDE([Measure_PriceDifference], [Measure_AdjustedPriceOnSecondLatestDate]) * 100



Hit_percentchanged_3 = 
VAR MaxDate = CALCULATE(MAX('GP' [Date]), REMOVEFILTERS('GP' [Date]))
VAR SecondLatestDate = CALCULATE(MAX('GP' [Date]), FILTER(ALL('GP'), 'GP' [Date] < MaxDate))
VAR PriceOnMaxDate = CALCULATE(MAX('GP' [Close Price]), FILTER(ALL('GP'), 'GP' [Date] = MaxDate))
VAR PriceOnSecondLatestDate = CALCULATE(MAX('GP' [Close Price]), FILTER(ALL('GP'), 'GP' [Date] = SecondLatestDate))
VAR AdjustedPriceOnSecondLatestDate = PriceOnSecondLatestDate / 5
VAR PriceDifference = PriceOnMaxDate - AdjustedPriceOnSecondLatestDate
VAR PercentPriceDifference = DIVIDE(PriceDifference, AdjustedPriceOnSecondLatestDate) * 100

RETURN
IF(
    NOT(ISBLANK(PriceOnSecondLatestDate)) && NOT(ISBLANK(PriceOnMaxDate)),
    PercentPriceDifference,
    BLANK()
)



Measure_MaxDate = CALCULATE(MAX('GP' [Date]), REMOVEFILTERS('GP' [Date]))
Measure_SecondLatestDate = CALCULATE(MAX('GP' [Date]), FILTER(ALL('GP'), 'GP' [Date] < [Measure_MaxDate]))
Measure_PriceOnMaxDate = CALCULATE(MAX('GP' [Close Price]), FILTER(ALL('GP'), 'GP' [Date] = [Measure_MaxDate]))
Measure_PriceOnSecondLatestDate = CALCULATE(MAX('GP' [Close Price]), FILTER(ALL('GP'), 'GP' [Date] = [Measure_SecondLatestDate]))
Measure_AdjustedPriceOnSecondLatestDate = DIVIDE([Measure_PriceOnSecondLatestDate], 5)
Measure_PriceDifference = [Measure_PriceOnMaxDate] - [Measure_AdjustedPriceOnSecondLatestDate]
Measure_LPD = DIVIDE([Measure_PriceDifference], [Measure_AdjustedPriceOnSecondLatestDate])


Hit_percentchanged_3 = 
VAR MaxDate = CALCULATE(MAX('GP' [Date]), REMOVEFILTERS('GP' [Date]))
VAR SecondLatestDate = CALCULATE(MAX('GP' [Date]), FILTER(ALL('GP'), 'GP' [Date] < MaxDate))
VAR PriceOnMaxDate = CALCULATE(MAX('GP' [Close Price]), FILTER(ALL('GP'), 'GP' [Date] = MaxDate))
VAR PriceOnSecondLatestDate = CALCULATE(MAX('GP' [Close Price]), FILTER(ALL('GP'), 'GP' [Date] = SecondLatestDate))
VAR AdjustedPriceOnSecondLatestDate = IF(NOT(ISBLANK(PriceOnSecondLatestDate)), DIVIDE(PriceOnSecondLatestDate, 5), BLANK())
VAR PriceDifference = IF(NOT(ISBLANK(PriceOnMaxDate)) && NOT(ISBLANK(AdjustedPriceOnSecondLatestDate)), PriceOnMaxDate - AdjustedPriceOnSecondLatestDate, BLANK())
VAR LPD = IF(NOT(ISBLANK(PriceDifference)) && NOT(ISBLANK(AdjustedPriceOnSecondLatestDate)), DIVIDE(PriceDifference, AdjustedPriceOnSecondLatestDate), BLANK())
RETURN
IF(
    NOT(ISBLANK(PriceOnSecondLatestDate)) && NOT(ISBLANK(PriceOnMaxDate)),
    LPD
)



Hit_percentchanged_3 = 
VAR MaxDate = CALCULATE(MAX('GP' [Date]), REMOVEFILTERS('GP' [Date]))
VAR SecondLatestDate = CALCULATE(MAX('GP' [Date]), FILTER(ALL('GP'), 'GP' [Date] < MaxDate))
VAR PriceOnMaxDate = CALCULATE(MAX('GP' [Close Price]), FILTER(ALL('GP'), 'GP' [Date] = MaxDate))
VAR PriceOnSecondLatestDate = CALCULATE(MAX('GP' [Close Price]), FILTER(ALL('GP'), 'GP' [Date] = SecondLatestDate))
VAR AdjustedPriceOnSecondLatestDate = DIVIDE(PriceOnSecondLatestDate, 5)
VAR PriceDifference = PriceOnMaxDate - AdjustedPriceOnSecondLatestDate
VAR LPD = DIVIDE(PriceDifference, AdjustedPriceOnSecondLatestDate)
RETURN
IF(
    NOT(ISBLANK(PriceOnSecondLatestDate)) && NOT(ISBLANK(PriceOnMaxDate)),
    DIVIDE(PriceDifference, AdjustedPriceOnSecondLatestDate)
)
