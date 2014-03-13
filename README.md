# Campaign manager tools version 1

The inital goal of these tools is to automate simple fundraiser research through the ORESTAR database. The focus is on targeting individuals by constructing csv files to model relationships between contributions. The tools will track a database of csv files constructed from the ORESTAR database. The output of the database is csv files, constructed with these tools.

## The Database

The database conceptually consists of named columns from the database. A csv file is speceifeid as a comma separated list of database address. The addressing scheme will allow columns to be constructed by combining lists from the database (for example the top ten other campagins your contributors have contributed to [you could rank this according to money or net contributors]) and construct columns from set combinations over those lists (e.g. a intersection of all lists), and rank them. This will ideally be accomplished by querying the database, and using a text interface that can be used with a variety of programming languages or shells.

There will also be tools to keep track of a database of csv files.

## Exporting

The main export and working format is csv. These tools will be the basis of a variety of more complex, useful tools that use csv.

## Importing

Version 1 will import by scraping the ORESTAR website with scrapy, and parsing it somehow. It will also download the excel file from the ORESTAR website, and parse that if necessary.


> Written with [StackEdit](https://stackedit.io/).
