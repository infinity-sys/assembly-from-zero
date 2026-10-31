# Exercises

## E01 - your age, and 300
Change the exit code in episodes/E01/exit42.asm to your age; build, run, check `echo $?`.
Then predict on paper: what does `echo $?` print for an exit code of 300?
Answer: in E02 (episodes/E02/exit300.asm).

## E02 - break it three ways
In episodes/E02: typo.asm (mvo instead of mov), nostart.asm (_start renamed to main),
wrongsec.asm (section .data instead of .text). Predict where each fails: assemble, link or run.
Answer: at the start of E03.
