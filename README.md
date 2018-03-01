# Polygon

[![Travis-CI Build Status](https://travis-ci.org/DataWookie/polygon.svg?branch=master)](https://travis-ci.org/DataWookie/polygon)

A lightweight R interface to the polygon.io API. This version supports the **free** high quality forex tick-leve data downloads. 

<br/>

## **<https://polygon.io/>**

Provides all types of high-quality financial data. The nice folks at this business also let us downalod for free tick level forex data.

You can sign-up for **free** and get your API key which you will need to access the data.

<br/>

## R Interface: Getting Started

The `polygon` package provides a convenient and lightweight interface to the polygon.io API.

To get started, install the package from GitHub:

```{r, eval=FALSE}

devtools::install_github("DataWookie/polygon")

```

Load the package along with other libraries you will need:

```{r, eval=FALSE}

pacman::p_load(polygon, dplyr, httr, jsonlite, tidyverse, stringr, hms)

```


Set your API key:

```{r, eval=FALSE}

set_api_key("insert-your-free-api-key-here")

```

<br/>

## Getting your data


List of currency pairs that are available for downlaod:

```{r, eval=FALSE}

meta_currency_symbols()
No encoding supplied: defaulting to UTF-8.
 [1] "AUD/CAD" "AUD/CHF" "AUD/JPY" "AUD/NZD" "AUD/USD" "CAD/CHF" "CAD/CHF" "CHF/JPY" "EUR/AUD" "EUR/CAD"
[11] "EUR/CHF" "EUR/CZK" "EUR/DKK" "EUR/GBP" "EUR/HUF" "EUR/JPY" "EUR/NOK" "EUR/NZD" "EUR/PLN" "EUR/SEK"
[21] "EUR/TRY" "EUR/USD" "GBP/AUD" "GBP/CAD" "GBP/CHF" "GBP/JPY" "GBP/NZD" "GBP/USD" "NZD/CAD" "NZD/CHF"
[31] "NZD/JPY" "NZD/USD" "SGD/JPY" "USD/CAD" "USD/CHF" "USD/CZK" "USD/DKK" "USD/HKD" "USD/HUF" "USD/JPY"
[41] "USD/MXN" "USD/NOK" "USD/PLN" "USD/SEK" "USD/SGD" "USD/TRY" "USD/ZAR" "XAG/USD" "XAU/AUD" "XAU/CHF"
[51] "XAU/EUR" "XAU/GBP" "XAU/USD" "ZAR/JPY"

```

<br/>
Getting historic data with **`historic_forex`**. There are 4 inputs:

    * the currency `pair` eg: "AUD/USD"
    * `date` provided as "YYYY-MM-DD"
    * 'offset' is the number of seconds you want from (see example below)
    * number of quotes you want returned using `limit`. There is a cap of 10,000 quotes per enquiry

A data frame is returned.
```{r, eval=FALSE}

historic_forex("AUD/USD", "2018-02-16", limit = 5)
                     time    pair     bid     ask
1 2018-02-16 00:48:10.289 AUD/USD 0.79414 0.79397
2 2018-02-16 00:48:15.693 AUD/USD 0.79414 0.79397
3 2018-02-16 00:48:15.992 AUD/USD 0.79414 0.79397
4 2018-02-16 00:48:20.947 AUD/USD 0.79414 0.79398
5 2018-02-16 00:48:35.957 AUD/USD 0.79414 0.79397)

```

<br/>

Getting continous data:

```{r, eval=FALSE}

w <- historic_forex("AUD/USD", "2018-02-16", limit = 30) 
x <- historic_forex("AUD/USD", "2018-02-16", limit = 20) 

# This is how you get the last second from which you want the next lot of data 
offset <- x[nrow(x), 1] %>% str_split( pattern = " ") %>% unlist() %>% 
  .[2] %>% hms::as.hms(.) %>% as.numeric 


y <- bind_rows(x, historic_forex("AUD/USD", "2018-02-16", offset = offset, limit = 11)) %>% unique 

# renumber the rows to enable identical test 
row.names(y) <- 1:nrow(y)

identical(w, y)
[1] TRUE

```

<br/>

Getting Spot rates:

```{r, eval=FALSE}
last_quote_forex("AUD/USD")
No encoding supplied: defaulting to UTF-8.
# A tibble: 1 x 4
                     time    pair     bid     ask
                   <dttm>   <chr>   <dbl>   <dbl>
1 2018-02-23 22:03:09.415 AUD/USD 0.78426 0.78461
```
