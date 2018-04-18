# Steps to One

This is a problem focused dynamic programming.

The object is to find the least possible number of steps to get from n to 1.

Steps can be one of the following:

```
subtract 1
divide by 2 // Only if the current value is divisible by 2
divide by 3 // Only if the current value is divisible by 3
```

It optimizes run time execution speed over memory.

Usage

Clone the project

To run the tests:

`rspec`

The first time you run the test it will create a fixture file for future use: ~35 seconds of real time.

Subsequent test runs should be less than 1 second.

