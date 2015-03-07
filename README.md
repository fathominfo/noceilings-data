## Data for No Ceilings: The Full Participation Project

This is a repository of the data behind the [No Ceilings](http://noceilings.org) site. 

Please use http://noceilings.org/data when linking to this page. 

> In 1995, at the UN Fourth World Conference on Women in Beijing, leaders from governments and civil society around the world came together and committed to ensuring that women and girls have the opportunity to participate fully in all aspects of life.

> This year marks the 20th anniversary of that moment. The Bill & Melinda Gates Foundation and the No Ceilings initiative of the Bill, Hillary & Chelsea Clinton Foundation have joined forces to gather data and analyze the gains made for women and girls over the last two decades, as well as the gaps that remain.

> This site and The Full Participation Report are the result—home to 850,000 data points, spanning more than 20 years, from over 190 countries. Through data visualizations and stories, we aim to present the gains and gaps in understandable, sharable ways—including by making the data open and easily available.

You can read more about the No Ceilings project [here](http://noceilings.org/about). 


One of the most important aspects of this project is the compilation and collation of such a large number of statistics into a single location. We'd like to encourage students, researchers, hobbyists, and other interested parties to do their own analyses and visualizations on topics they care about.

### Indicators

The data consists of ~900 topics (referred to as "indicators"), each of which covers a focus area across a set of years and a list of countries.

The list of indicators is available in several formats: [HTML](http://htmlpreview.github.com/?https://raw.githubusercontent.com/fathominfo/noceilings-data/master/indicators.html), [Markdown](https://github.com/fathominfo/noceilings-data/blob/master/indicators.md), [CSV](https://raw.githubusercontent.com/fathominfo/noceilings-data/master/indicators.csv), and [JSON](https://raw.githubusercontent.com/fathominfo/noceilings-data/master/indicators.json). 

The data is collected from an enormous number of sources. They can be seen in the *source* column on the indicators list.

Data from noceilings.org that lists *WORLD Policy Analysis Center* as the source has additional restrictions on its use and therefore is not available as part of this repository. Visit [their site](http://worldpolicyforum.org/noceilings) for more information.

### Explanation of the indicators file

The primary, secondary, and tertiary columns are used at http://noceilings.org/map as a means for organizing the indicators into something that can be reasonably browsed. Instead of presenting users with ~900 entries topics, they're first grouped into a 'theme'. Next, there's a 'primary' name (seen on the map as the title at the top). For instance, pisa scores use...

The 'flavor' entry is either 'num' or a semicolon-separated list of variants for this entry. This is an anachronism from the process of how the data was integrated. In future releases, this property won't be present (or will be set to null) for numeric data, and list the variants in an array (rather than requiring the split() call).

### Individual data files

most data is 1995-2014, but some data has 1990 info (usually 1990, 1995, 2000..)

columns with no data are removed from the CSV file

### Countries and regions

explanation of the regional groupings
regional groupings file

add the country list (iso 2, iso 3, name, full name)

### Additional background

We (Fathom) received this data in a pair of flat files (one for numeric, one non-numeric). Where possible, we've corrected some errors, grouped the data into categories, and tried to create an accessible format that would be usable for other projects. 
