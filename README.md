# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Justin Buffaloe & Adam Zens
## Summary
In this lab, we built the same five-state Moore machine using one-hot and binary encoding. We learned how the current state and the input w determine where the machine goes on the next clock edge. The output z depends only on the current state and turns on in C or E. We used K-maps to turn the state table into equations for the D input of each flip-flop. For the binary design, each of our three K-maps gave us one bit of the next state.
## Lab Questions

### Compare and contrast One Hot and Binary encodings
One-hot encoding uses one flip-flop per state, with exactly one flip-flop on at a time. Binary encoding uses flip-flops together to store a state’s binary code. For example, state C is 00100 in our five-bit one-hot design and 010 in our three-bit binary design. Both versions follow the same state diagram and produce the same z output.
### Which method did your team find easier, and why?
We found one-hot easier because we could write an equation by following the arrows into a state. For example, B is next when w = 0 and the current state is A, D, or E. We could read that directly from the diagram. Binary took more work because we had to look up each destination’s code and place its three bits into three separate K-maps. Making alot more work to find the equations for the binary.
### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
If we had only three flip-flops available for this five-state machine, we would need binary encoding because one-hot requires five. If we had enough flip-flops but needed to reduce the logic used to recognize states, one-hot could be a better choice. For example, our one-hot design can detect C or E by ORing their two state bits. The binary design needs logic to recognize those states from their codes. On an FPGA, that choice depends on which resource is tighter: flip-flops for storing the state or lookup tables for implementing the logic.
