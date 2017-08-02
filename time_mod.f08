! Copyright (C) 2017 Denis Bernard.
! License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
! This is free software: you are free to change and redistribute it.
! There is NO WARRANTY, to the extent permitted by law.
! Written by Denis Bernard.
!
module time 
   use iso_c_binding,only:c_int,c_long 
   implicit none 
   interface 
      module function timestamp() 
         character(len=:),allocatable::timestamp 
      end function timestamp 
   end interface 
end module time 
 
