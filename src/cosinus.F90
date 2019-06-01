program main

    use, intrinsic :: iso_c_binding
    implicit none
    include "fftw3.f03"

    integer, parameter :: n = 1024 
    real(c_double), allocatable :: array(:)
    complex(c_double_complex), allocatable :: result_array(:)
    type(c_ptr) :: plana, planb

    real(16) :: x = 0.0
    real(16) :: dx=10/real(n-1)
    real(16) :: val
    integer::i

    

    integer,parameter :: seed = 86456
    call srand(seed)

    open (unit = 1, file = "../res/cosinus")                      ! cosinus
    open (unit = 2, file = "../res/foul_cosinus")                 ! zanieczyszczony cosinus
    open (unit = 3, file = "../res/cosinus_frequency")            ! widmo transformaty
    open (unit = 4, file = "../res/cosinus_clear_frequency")      ! oczyszczone widmo transformaty
    open (unit = 5, file = "../res/cosinus_clear_after_dft")      ! odwrócona trnsformata
    
    allocate(array(n))
    allocate(result_array(n/2+1))
    
    do i=1,n
        x=x+dx
        array(i) = cos(x)
        write(1,*) array(i)
        write(2,*) x," ",array(i) + (rand() - rand())
    end do

    plana = fftw_plan_dft_r2c_1d(size(array), array, result_array, FFTW_ESTIMATE+FFTW_UNALIGNED)
    planb = fftw_plan_dft_c2r_1d(size(array), result_array, array, FFTW_ESTIMATE+FFTW_UNALIGNED)
    call fftw_execute_dft_r2c(plana, array, result_array)


    do i=1,n/2+1
        val=abs(result_array(i))
        if(val /= val)val=0.0
        write(3,'(I15," ", F15.10)')i, val
       
        if(abs(result_array(i))<50) result_array(i)=0.0
        write(4,'(I15," ", F15.10)')i, abs(result_array(i))
    end do


    call fftw_execute_dft_c2r(planb, result_array, array)

    x = 0.0
    dx=10/real(n-1)
    do i=1,n
        x=x+dx
        write(5,*) x," ",array(i)/n
 
    end do
  

    call fftw_destroy_plan(plana)
    call fftw_destroy_plan(planb)
    
    close(1)
    close(2)
    close(3)
    close(4)
    close(5)
    
      
end program main