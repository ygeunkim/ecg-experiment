
# 1 Electrocardiogram Experiment

## 1.1 About the project

This is a project performed in [SKKU **Design and Analysis of
Experiments**](https://www.kwonsanglee.com) ([Lee 2021](#ref-sta5031)).

-   Conduct a real randomized experiment, collect data, and analyze
    them.
-   Present a non-statistical paper using an (quasi-)experiment in the
    field outside statistics and critize them.
-   Bring my own research that is related to an (quasi-)experiment.

I chose real experimental design, the first one.

## 1.2 Goal of the Experiment

-   **Does caffeine affect electrocardiogram (ECG)?**
-   Caffeine: drinking capsule coffee 40 ml
-   ECG result: average heart rate

## 1.3 Design

We implement Latin square design ([Box, Hunter, and Hunter
2005](#ref-Box:2005ug)). For example,

<table>
<caption>
Latin square example
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

We will randomly allocate treatments A, B, C, and D in the table.

-   A, B, C, D once in every row,
-   once in every column

### 1.3.1 About factors

-   Latin square: 4 by 4
-   2 blocks components
    -   Coffee (40 ml) to water ratio
        1.  1:0 (Espresso)
        2.  1:2
        3.  1:8
        4.  1:15
    -   Drinking speed
        1.  &lt;=5 sec
        2.  5-20 sec
        3.  20-50 sec
        4.  50&lt; sec
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
    -   same as random allocation

``` r
set.seed(1)
sample(LETTERS[1:4])
#> [1] "A" "C" "D" "B"
```

### 1.3.2 Output

-   Measure ECG using *Apple watch Series 4*: See
    <https://support.apple.com/en-us/HT208955>
-   Output: **Average Heart rate (in BPM)**

### 1.3.3 Controlling other variables

-   Drink coffee every morning, before eating breakfast
-   When Measuring ECG,
    -   sit at my desk
    -   rest arms on a my desk
-   Use same strip for apple watch: [Nike sport
    band](https://www.apple.com/shop/product/MX8C2AM/A/40mm-anthracite-black-nike-sport-band-regular?fnode=5e9ad1340eb02decfee1689be9360555f2f276ad270a672413266cfba01ad7b0e20a1c634dbd66eaec20c01170cf533573070d71c910b376e339037f157174b7e6f45e144d64e052e5274d1069eb67b4)
    of same fit
-   Nespresso machine: [Pixie
    C61](https://www.nespresso.com/kr/en/order/machines/original/pixie-electric-red-coffee-machine)
    in my home

------------------------------------------------------------------------

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-Box:2005ug" class="csl-entry">

Box, George E. P., J. Stuart Hunter, and William G. Hunter. 2005.
*Statistics for Experimenters: Design, Innovation, and Discovery*.
Wiley-Interscience.

</div>

<div id="ref-sta5031" class="csl-entry">

Lee, Kwonsang. 2021. “Design and Analysis of Experiments (Sta5031).”
Department of Statistics, Sungkyunkwan University;
<https://icampus.skku.edu>.

</div>

</div>
