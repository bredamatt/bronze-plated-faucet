/// BPF Program runs in kernel-space, so no std library
/// BPF Program does not need a main function.
/// Instead, it needs a function which serves as an instrumentation hook.
#![no_std]
#![no_main]

/// Add BPF related symbols (kprobe, map, kretprobe, program, macros and maps API like redbpf_probes::maps::HashMap, 
/// redbpf_probes::maps::PerfMap) and rust bindings for common kernel structures like struct sock, struct file
use redbpf_probes::kprobe::prelude::*;

/// Set version and GPL license
program!(0xFFFFFFFE, "GPL");


/// Define the perf event map
#[map]
static mut OPEN_PATHS: PerfMap<OpenPath> = PerfMap::with_max_entries(1024);

