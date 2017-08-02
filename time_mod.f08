module time 
   use iso_c_binding,only:c_int,c_long 
   implicit none 
   interface 
      module function timestamp() 
         character(len=:),allocatable::timestamp 
      end function timestamp 
   end interface 
end module time 
 
