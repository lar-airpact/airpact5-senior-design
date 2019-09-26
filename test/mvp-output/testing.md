# Generic testing plan

These zips contain output data from a bluesky run from the existing aeolus server, and our theoretical MVP. The files in these folders will be tested for similarity to verify output of the MVP and the ability to proceed.

## Ideology to test the data
Using the data

* Use Python3 with pandas to parse the csv files
* Sort into dictionaries 
* compare and classify into similarity

Known things to deal with in verifying the data:

* data is not natively sorted so testing will need to handle this