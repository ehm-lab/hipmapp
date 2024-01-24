### Source

This app is also available as an R package from this github-repository: <https://github.com/ehm-lab/hipmapp>

And can be installed with:

`# install.packages("devtools")`

`devtools::install_github("ehm-lab/hipmapp")`

### Tabs

In the **Map** tab, the projected values are mapped onto the geography of Europe. Buttons, sliders, and selection boxes are provided, allowing for the setting of different scenarios as well as data filtering. The layer button in the top-right controls the basemap tiles and by extension the names of the cities and countries shown.

The **Rank** tab features an interactive table that presents the projected values sorted in terms of an impact measure. The same filtering options as in the map are available, allowing cities within a country, or different countries, to be compared. The Group column attempts to create four ranked groups based on all the projected values being compared, with Group 4 being the most impacted. The search box and export buttons are functional, with the latter permitting the download of the displayed table. The number of rows to be shown can be adjusted in the entries box. To download the full table, first show all the rows.

The sub-scenario column corresponds to the toggle of the same name. The values within the column were left unchanged from the original data and have correspond as follows:

> demo = Historical+Demographic\
> full = Full\
> full-demo (read as full minus demo) = Climate change

For further information on these sub-scenarios please see the last paragraph of **Methodology**

Within the table views, the impact measures are labeled as AN, AF, and Rate, representing excess number of deaths, excess fraction of deaths, and excess mortality rate respectively.

The **All Data** tab provides the option to download all six main datasets by making a selection and clicking the download button. These datasets are the six combinations of three spatial aggregation levels, city, country or region, and two projection dimensions, 5-year periods or global warming levels.
