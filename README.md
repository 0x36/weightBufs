# WeightBufs:

`WeightBufs` is a kernel r/w exploit for all Apple devices with Neural Engine support.
Bugs and Exploit by [@_simo36_](https://twitter.com/_simo36), you can read my [presentation slides at POC](https://github.com/0x36/weightBufs/blob/main/attacking_ane_poc2022.pdf) for more details about the vulnerabilities and the exploitation techniques.

The exploit doesn't rely on any hardcoded address or offset, and it should work AS IS on macOS12 up to 12.4 and *OS 15 up to 15.5. 

The kernel vulerabilties affect all iOS 15 versions (up to 16.0), however the sandbox escape has been fixed on iOS 15.6. As a result, breaking the exploit chain and another sandbox escape is required to get things working again on iOS 15.6/15.7.
Although I have another sandbox escape that works up to iOS 16.1, I'm not sure if the kernel exploit techniques are still usable on iOS 15.6+.


# Vulnerabilities:

The exploit chains 4 vulnerabilities which I independently discovered and reported to Apple:
 * `CVE-2022-32845` : aned signature check bypass for model.hwx.
 * `CVE-2022-32948` : DeCxt::FileIndexToWeight() OOB Read due to lack of array index validation.
 * `CVE-2022-42805` : ZinComputeProgramUpdateMutables() potential arbitrary read due to Integer overflow issue.
 * `CVE-2022-32899` : DeCxt::RasterizeScaleBiasData() Buffer underflow due to integer overflow issue.

# Tested devices:

 * iPhone12 Pro (iPhone13,3) with iOS 15.5.
 * iPad Pro (iPad8,10) with iPadOS 15.5.
 * iPhone11 Pro (iPhone12,3) with iOS 15.4.1.
 * MacBookAir10,1 M1 with macOS 12.4.


# Notes:

There are some situations where the exploit may fail:
- The target *IOSurface* or *IOSurfaceClient* object address is upper to the mutable kernel buffer `MUTK`,however the exploit detects the failure early, preventing the device from crashing. It's sufficient to run the exploit again and it should succeed on the second attempt.
- If the exploit frequently crashes the device at stage 2 or stage 3, that means it must be tuned to the tested device, make sure to read `DEBUG_EXPLOIT_STAGE_2_KERN_PANIC` and `DEBUG_EXPLOIT_STAGE_3_KERN_PANIC` for more details.
- The target device needs to be in an idle state, and it's preferable to reboot it before using the exploit, even better if the airplane mode is turned off.





