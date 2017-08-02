! Copyright (C) 2017 Denis Bernard.
! License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
! This is free software: you are free to change and redistribute it.
! There is NO WARRANTY, to the extent permitted by law.
! Written by Denis Bernard.
!
submodule(time) gettimeofday
!
   type,bind(c)::timeval       
      integer(kind=c_long)::tv_sec       
      integer(kind=c_long)::tv_usec       
   end type timeval
!   
   type,bind(c)::timezone       
      integer(kind=c_int)::tz_minuteswest       
      integer(kind=c_int)::tz_dsttime       
   end type timezone
!   
   contains 
   function timestamp() 
      character(len=19)::sec 
      character(len=6)::usec 
      type(timeval)::tv              
      type(timezone)::tz             
      if (f_gettimeofday(tv,tz) /= 0) error stop 'timestamp: fail' 
      write(unit=sec,fmt='(i0)')tv%tv_sec 
      write(unit=usec,fmt='(i0.6)')tv%tv_usec      
      timestamp=trim(sec)//"."//usec 
   end function timestamp
!
   function f_gettimeofday(tv,tz) 
      interface 
         function gettimeofday(tv,tz) bind(c) 
            import c_int,c_long,timeval,timezone 
            type(timeval),intent(out)::tv 
            type(timezone),intent(out)::tz 
            integer(c_int)::gettimeofday 
         end function gettimeofday 
      end interface 
      type(timeval),intent(out)::tv 
      type(timezone),intent(out)::tz 
      integer(kind=4)::f_gettimeofday 
      f_gettimeofday=gettimeofday(tv,tz) 
   end function f_gettimeofday 
end submodule gettimeofday  
