In order to read correlation functions stored in the Analysis File Format (AFF), Marcus Petschlies has implemented a thin R interface for basic aff library functions.

I have forked the aff library to our organisation repository:

github.com/hiskp-lqcd/aff

and have adjusted the default configuration file for Linux systems:

config/linux

to contain the -fPIC CFLAG which is required later.

When installing the aff library, make sure that whatever 

${prefix}/bin

you set is also in your ${PATH}. 
The aff library installation procedure will produce a small script "lhpc-aff-config" which will contain the include and library paths and which must be in your path for the next steps below.

I have taken Marcus's R routines and packaged them up in the 

github.com/hiskp-lqcd/Raff

package which you can install using the usual

R CMD INSTALL ${path}

directly from the sources. 
The configure will attempt to find "lhpc-aff-config" in your path in order to extract appropriate library and include directories.

The two functions

aff_read_key
aff_read_key_list

are documented using roxygen2 and examples are available

?Raff::aff_read_key
?Raff::aff_read_key_list

--
Bartosz Kostrzewa, June 18th, 2018
