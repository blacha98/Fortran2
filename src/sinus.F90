program main

    use, intrinsic :: iso_c_binding
    implicit none

    integer, parameter :: n = 2048 
    real(c_double), allocatable :: array(:)

    real(16) :: x = 0.0
    real(16) :: dx=10/real(n-1)
    integer::i
    integer::tmp

    integer,parameter :: seed = 86456
    call srand(seed)

    open (unit = 1, file = "../res/sinus") ! sinus
    open (unit = 2, file = "../res/foul_sinus") ! zanieczyszczony sinus
    
    allocate(array(n))

    
    do i=1,n
        x=x+dx
        array(i)=sin(2*3.1415*x*200)+2*sin(2*3.1415*x*400)
        write(1,*) x," ",array(i)
        write(2,*) x," ",array(i) + (rand() - rand())
    end do
    
    close(1)
    close(2)
      
end program main