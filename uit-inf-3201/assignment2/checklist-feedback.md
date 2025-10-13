# Code
The code doesn't use shortcuts that reduce the functionality of the program nor the difficulty of the assignment (e.g., using share file system of the cluster instead of MPI communications).

## sequential
It is explained how to compile and run the solution.
The code compiles, terminates correctly, and creates sobel and emboss filtered images.
The source code works for any image sizes.

## parallel
It is explained how to compile and run the parallel solution. 
The code of the parallel solution compiles, terminates correctly, and creates sobel and emboss filtered images. 
The source code is using C/C++, MPI and OpenMP.
The source code works for any image sizes and any number of processes.

## optimised
It is explained how to compile and run the optimised version. 
The code of the optimised version compiles, terminates correctly, and creates sobel and emboss filtered images. 

# Report
The project has been handed-in in time.

## introduction
The problem is understood and presented.

## sequential
The design of the sequential solution is presented and explained.

## parallel
The design of the parallel solution and how the workload is distributed are presented and explained.
The work it parallelises is the filtering of one image.

## optimised
The optimisations for the parallel version are presented and explained. At least one optimisation is presented.

## time performance analysis
The performances are measured according to the size of the image, the number of processes, and the number of threads.
The theoretical speedup has been computed and results are presented (i.e., expected performance improvement when sharing workload between processes).
The performance of the parallel version against sequential version is visible and explained.
The performance of the optimised version against parallel version is visible and explained.
An explanation about why the parallel version is faster than sequential version is given.
An explanation about why the optimised version is faster than parallel version is given.

## discussion
The positive and negative sides of the different versions are explained.

## summary
A summary concluding the work is given.

# Additional remarks
Very good work.

# Final grade
Passed.
