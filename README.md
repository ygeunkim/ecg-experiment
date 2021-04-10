
# Electrocardiogram Experiment

## Goal

-   **Does caffeine affect electrocardiogram (ECG)?**
-   Caffeine: drinking capsule coffee 40 ml

## Design

We use Latin square design (Box, Hunter, and Hunter 2005).

### About factors

-   Latin square: 4 by 4
-   2 blocks components
    -   Coffee (40 ml) to water ratio
        -   1:0 (Espresso)
        -   1:2
        -   1:8
        -   1:15
    -   Drinking speed
        -   &lt;=5 sec
        -   5-20 sec
        -   20-50 sec
        -   50&lt; sec
-   Interesting factor: [Intake of
    caffeine](https://www.reddit.com/r/nespresso/comments/id31r5/i_recieved_the_caffiene_content_numbers_for/)
    from [Starbucks by
    Nespresso](https://athome.starbucks.com/coffees-by-format/nespresso-original/)
    1.  House blend: 74.5 mg
    2.  Sumatra: 54.5 mg
    3.  Decaf espresso roast: 3 mg
    4.  None or water: 0 mg
-   Randomly allocate these treatments to A, B, C, and D: inside Latin
    square

``` r
set.seed(1)
sample(LETTERS[1:4])
#> [1] "A" "C" "D" "B"
```

### Output

-   Measure ECG using *Apple watch Series 4*: See
    <https://support.apple.com/en-us/HT208955>
-   Output: **Average Heart rate (in BPM)**

### Controlling other variables

-   Drink coffee every morning
-   Before breakfast
-   Measure ECG in the same pose, same location
-   Water temperature

------------------------------------------------------------------------

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-Box:2005ug" class="csl-entry">

Box, George E. P., J. Stuart Hunter, and William G. Hunter. 2005.
*Statistics for Experimenters: Design, Innovation, and Discovery*.
Wiley-Interscience.

</div>

</div>
