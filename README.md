# buffons-needle
A MATLAB implementation of the Buffon's needle problem for estimating π

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

The basic requirements for building the executable are:

* MATLAB/Octave

#### Installation of Octave on Ubuntu

```
sudo apt-get install octave
```
### Usage instructions
The usage example is at the top of the file, commented, for example:
```
Buffon(9.999, 10, 4, 10000)
```
This line of code will run the algorithm where the length of the needle is 9.999, the distance between lines is 10, the number of lines is 4 and the number of needles is 10000.

The script should run until π is estimated. The plotting should be turned off, it is just for demonstration purposes, and it is very expensive if you are interested in the value of π.
Now, you should see the executable in the build file. If you run the executable, the application should look like this:
![](https://github.com/biroeniko/buffons-needle/blob/master/img/buffon.png)

## Authors

* **Biró Enikő** - [BiroEniko](https://github.com/biroeniko)
