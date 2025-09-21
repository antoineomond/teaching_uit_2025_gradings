# Report
## introduction
The problem is understood and presented well.

## sequential
The design of the sequential solution is presented and explained well.

It is explained how to compile and run the solution.
The code compiles, terminates correctly, and finds the correct lock sequence.

## parallel
The design of the parallel solution is presented and explained well.
It is explained how to compile and run the solution. 
The code compiles, terminates correctly and finds the correct lock sequence. 
It has a better time than sequential. 

The optimisations for the parallel version are presented and explained well. A single optimisation is presented.
The optimised version compiles, terminates correctly and finds the correct lock sequence.
It has a better time than parallel.

## time performance analysis
The performances are measured according to the size of the lock and the number of processes. 
A theoretical expectation against experimental results is provided.
The speedup of the parallel version against sequential version is visible and explained.
The speedup of the optimised version against parallel version is visible and explained.
The hardware resources have been well described.

It would also have been interesting to run each experiments multiple times, and see if results are stable (i.e., standard deviation is low).

It is explained how time was measured in the code.

## discussion
The positive and negative sides of the optimised version are explained.

## summary
A summary concluding the work is given.

## overall quality
Very good.

# Additional remarks
Very good work.

# Final grade
Passed.

# 2025-09-19
checklist:
- [ ] intro: understanding of assignment
- [ ] seq: solution/design/implementation
- [ ] seq: how to run it
- [ ] para: parallelisation/design/implementation
- [ ] para: workload distrib
- [ ] para: optimised versions description/design/implementation
- [ ] para: how to run it
- [ ] perf: experiment setup description (parameters should be lock size and nb of process, metrics, hardware specs)
- [ ] perf: experiment results presentation (comparison seq/para, para/opti)
- [ ] disc: positive/negative points
- [ ] disc: theoretical vs practical analysis
- [ ] sum: conclusion of the work
- [ ] implem_seq: compile, execute, correct results
- [ ] implem_para: compile, execute, correct results
- [ ] implem_opti: compile, execute, correct results

# 2025-09-18
- Idea: upgrade the assignment to make it clear that:
    - the expes should be reproducible
    - students should not assume any knowledge about the lock sequence (consider it random)


