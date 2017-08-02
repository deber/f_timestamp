# f_timestamp

This a Fortran module to get a UNIX timestamp from the standard C library
function _gettimeofday()_ using iso_c_binding.

This is an early release and it is tested only under Linux x86_64. It must
not be used under 32 bits system.

There is only one function **timestamp()** without any argument that returns
a character string. This string is : the count of seconds (since 00:00:00 UTC
Thursday 1, January 1970), a dot as separator and 6 digits for microseconds.

Example, this short program, compiled with gfortran compiler at command line
(`gfortran time_mod.f08 gettimeofday_smod.f08 test.f08`):

```fortran
Program test
   use time,only:timestamp
   print*,timestamp()
end program test
```
gives something like `1501688363.955201` that means, in human language:

```
2017-08-02T15:39:23+00:00 (in ISO 8601)
Wed, 02 Aug 2017 15:39:23 +0000 (in RFC 822, 1036, 1123, 2822)
Wednesday, 02-Aug-17 15:39:23 UTC (in RFC 2822)
2017-08-02T15:39:23+00:00 (in RFC 3339)
```
