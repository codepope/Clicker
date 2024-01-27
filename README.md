# Clicker

This is a soft experiment to work out how few actual interactive elements a physiotherapy clicker/counter would need to cover most cases. The eventual aim, after perfecting the software version, will be to translate it to hardware that sits easily in your hand. But, first we have to perfect this version.

Currently, there's a minimal counter (set the clock to zero), timed rep counter (set the clock to anything not zero) and it's still up to you to know when you've done your larger count. No support for sets, as they seem silly to me and you know when to take a pause.

TODO:

* [ ] Make it work well across all Apple platforms.
* [ ] Make a Apple watch variant
* [ ] Make it pretty

Note: This code includes code (The PushSafer Library) that is licensed under the LGPL and is potentially incompatible with the MIT licences for this code. Given that the LGPL code in question is always statically linked with the final binaries though (most microcontrollers lack dynamic linking) it is technically impossible for a user to ever be able to comply with the terms of the LGPL. 

