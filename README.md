
# Electrocardiogram Experiment

## About the project

This is a project performed in [SKKU **Design and Analysis of
Experiments**](https://www.kwonsanglee.com) ([Lee 2021](#ref-sta5031)).

-   Conduct a real randomized experiment, collect data, and analyze
    them.
-   Present a non-statistical paper using an (quasi-)experiment in the
    field outside statistics and criticize them.
-   Bring my own research that is related to an (quasi-)experiment.

I chose real experimental design, the first one. The followings are my
works:

1.  [Project
    presentation](https://github.com/ygeunkim/ecg-experiment/blob/master/static/slides/youngslide.pdf)
2.  [Appendix](https://github.com/ygeunkim/ecg-experiment/blob/master/static/appendix/youngsuppl.pdf)

## Goal of the Experiment

-   **Does caffeine affect electrocardiogram (ECG)?**
-   Caffeine: drinking capsule coffee 40 ml
-   ECG result: average heart rate

## Design

We implement Latin square design ([Fisher 1935](#ref-Fisher:1935uc)).
For example,

<table>
<caption>
Reduced latin square
</caption>
<thead>
<tr>
<td colspan="2">
</td>
<th colspan="5">
Drinking speed
</th>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2">
</td>
<td>
1
</td>
<td>
2
</td>
<td>
3
</td>
<td>
4
</td>
</tr>
<tr>
<th rowspan="4">
Coffee to water ratio
</th>
<td>
1
</td>
<td>
A
</td>
<td>
B
</td>
<td>
C
</td>
<td>
D
</td>
</tr>
<tr>
<td>
2
</td>
<td>
B
</td>
<td>
C
</td>
<td>
D
</td>
<td>
A
</td>
</tr>
<tr>
<td>
3
</td>
<td>
C
</td>
<td>
D
</td>
<td>
A
</td>
<td>
B
</td>
</tr>
<tr>
<td>
4
</td>
<td>
D
</td>
<td>
A
</td>
<td>
B
</td>
<td>
C
</td>
</tr>
</tbody>
</table>

-   A, B, C, D once in every row,
-   once in every column

### About factors

-   Latin square: 4 by 4
-   2 blocking factors
    -   **Row**: Coffee (40 ml) to water ratio
        1.  1:0 (Espresso)
        2.  1:2.5 (Water 100 ml)
        3.  1:5 (Water 200 ml)
        4.  1:7.5 (Water 300 ml)
    -   **Column**: Drinking speed
        1.  &lt;=5 sec
        2.  5-15 sec
        3.  15-30 sec
        4.  30&lt; sec
-   Interesting factor: [Intake of
    caffeine](https://www.reddit.com/r/nespresso/comments/id31r5/i_recieved_the_caffiene_content_numbers_for/)
    from [Starbucks by
    Nespresso](https://athome.starbucks.com/coffees-by-format/nespresso-original/)
    1.  House blend: 74.5 mg
    2.  Sumatra: 54.5 mg
    3.  Decaf espresso roast: 3 mg
    4.  None or water: 0 mg
-   Randomly allocate these treatments `1`, `2`, `3`, and `4` to A, B,
    C, and D
    -   assign these to above table
    -   random treatment assignment

``` r
set.seed(1)
sample(LETTERS[1:4])
#> [1] "A" "C" "D" "B"
```

### Output

-   Measure ECG using *Apple watch Series 4*: See
    <https://support.apple.com/en-us/HT208955>
-   Output: **Average Heart rate (in BPM) difference** between after and
    before taking the coffee

### Controlling other variables

-   Drink coffee every morning (between 8:30 a.m. and 9:00 a.m. KST),
    after eating a piece of bread
-   When Measuring ECG,
    -   sit at my desk
    -   rest arms on a my desk
-   Use same strip for apple watch: [Nike sport
    band](https://www.apple.com/shop/product/MX8C2AM/A/40mm-anthracite-black-nike-sport-band-regular?fnode=5e9ad1340eb02decfee1689be9360555f2f276ad270a672413266cfba01ad7b0e20a1c634dbd66eaec20c01170cf533573070d71c910b376e339037f157174b7e6f45e144d64e052e5274d1069eb67b4)
    of same fit
-   Nespresso machine: [Pixie
    C61](https://www.nespresso.com/kr/en/order/machines/original/pixie-electric-red-coffee-machine)
    in my home

## Brief Result

### Data set

    #>    row col1 col2 col3  col4 Mean
    #> 1 row1 9.00  1.0 7.00  3.00 5.00
    #> 2 row2 2.00  6.0 3.00 14.00 6.25
    #> 3 row3 4.00  3.0 1.00  0.00 2.00
    #> 4 row4 2.00  4.0 2.00  4.00 3.00
    #> 5 Mean 4.25  3.5 3.25  5.25 4.06

### ANOVA

    #>             Df Sum Sq Mean Sq F value Pr(>F)
    #> water        3   44.2   14.73    1.63   0.28
    #> speed        3    9.7    3.23    0.36   0.79
    #> coffee       3   78.7   26.23    2.89   0.12
    #> Residuals    6   54.4    9.06

Read the slide and the report for the next results based on
*F*<sub>*T**r**e*</sub> = 2.894😄!

------------------------------------------------------------------------

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-Fisher:1935uc" class="csl-entry">

Fisher, Sir Ronald Aylmer. 1935. *The Design of Experiments*. Oliver &
Boyd, Edinburgh & London.

</div>

<div id="ref-sta5031" class="csl-entry">

Lee, Kwonsang. 2021. “Design and Analysis of Experiments (Sta5031).”
Department of Statistics, Sungkyunkwan University;
<https://icampus.skku.edu>.

</div>

</div>
