
# Electrocardiogram Experiment

## Goal

-   **Does caffeine affect electrocardiogram (ECG)?**
-   Caffeine: drinking capsule coffee 40 ml
-   ECG result: average heart rate

## Design

We implement Latin square design (Box, Hunter, and Hunter 2005). For
example,

<table>
<caption>
Latin square example
</caption>
<thead>
<tr>
<td colspan="2">
</td>
<th colspan="5">
Coffee to water ratio
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
Drinking speed
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

### About factors

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

### Output

-   Measure ECG using *Apple watch Series 4*: See
    <https://support.apple.com/en-us/HT208955>
-   Output: **Average Heart rate (in BPM)**

### Controlling other variables

-   Drink coffee every morning, before eating breakfast
-   When Measuring ECG,
    -   sit at my desk
    -   rest arms on a my desk
-   Use same strip for apple watch: [Modern
    buckle](https://www.apple.com/shop/product/MY662AM/A/40mm-scarlet-modern-buckle-small?fnode=a752f02930ae068b20b0bd9682d5cc42653383b01f5d691eb1ced059ce28de220bacf6009213e93e9c00295f48285a7ed49f95a0721d433ea8c006ff7772eb3d0f0dab89c6c9538ff9063124f30717a6),
    because its length is fixed.
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

</div>
