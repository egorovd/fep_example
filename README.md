fep_example
===========

Example app for: [Fast Erlang Pool (fep)](https://github.com/egorovd/fep)

fep
---

Fast Erlang Pool on NIF lock-free Queue using C++ the library: [moodycamel::concurrentqueue](https://github.com/cameron314/concurrentqueue/tree/8f7e861dd9411a0bf77a6b9de83a47b3424fafba)

#### moodycamel::ConcurrentQueue

An industrial-strength lock-free queue for C++.

**Features**:

* Knock-your-socks-off blazing fast performance.
* Single-header implementation. Just drop it in your project.
* Fully thread-safe lock-free queue. Use concurrently from any number of threads.
* C++11 implementation -- elements are moved (instead of copied) where possible.
* Templated, obviating the need to deal exclusively with pointers -- memory is managed for you.
* No artificial limitations on element types or maximum count.
* Memory can be allocated once up-front, or dynamically as needed.
* Fully portable (no assembly; all is done through standard C++11 primitives).
* Supports super-fast bulk operations.
* Includes a low-overhead blocking version (BlockingConcurrentQueue).
* Exception safe.




Build and Run
-------------

    $ rebar3 run

```erlang
example:run().
```

    [example] 1 Crete pool.
    [example] 2 Start worker.
     [worker]  1 Init Worker with ref: #Ref<0.1566303924.3213230081.251838>
     [worker]  2 Push Worker in Pool.
    [example] 3 Worker Pid: <0.835.0>
    [example] 4 Pop worker from Pool. Pid: <0.835.0>
    [example] 5 Send Msg to worker.
    [example] 6 Stop worker.
     [worker]  3 Receive Msg ...
     [worker]  4 Push worker in Pool
     [worker]  5 Stoped.
    [example] 7 Try pop worker if alive. Worker is alive ?  dead

