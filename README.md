![version](https://img.shields.io/static/v1?label=multipleFileTranser&message=0.2&color=brightcolor)
[![license: mit](https://img.shields.io/badge/license-mit-blue.svg)](https://opensource.org/licenses/mit)


# Transfer multiple files by scp without repeated manual password entry

*Problem:* transferring multiple tar files from a remote computer can be laborious. 
This script eases this task.

The bash script `mcopy.sh` above does not require the repeated entry of your password after each file is transferred.
It uses the Unix program sshpass to pass your password to the program scp.
The script does the file transfers sequentially. 

The script loops over a list of files.
The script reports to the terminal when a file transfer has started and when it has been completed.
Edit to use any WAV file to report an audible alert when the transfers are finished.
I used the canary.wav file but any wav file you find on the web should work.

- Replace PASSWORD with your password. Keep the double quotes around your password.
- Enter a list of tar files to transfer on the line starting with `for`. 
- The list is whitespace-separated.
- The length of the list depends on the speed of your network, the connection's stability, and the files' size.
- Generally, transferring 100 GB of tar files takes about an hour.
- Make executable: chmod a+x mcopy.sh.
- Enter `./mcopy.sh` in the destination folder.

## Update History

|Version      | Changes                                         | Date            |
|:-----------:|:-----------------------------------------------:|:---------------:|
| Version 0.3 |  Fixed typos in README.md                       | 2024 April 10   |


## Sources of funding

- NIH: R01 CA242845
- NIH: R01 AI088011
- NIH: P30 CA225520 (PI: R. Mannel)
- NIH P20GM103640 and P30GM145423 (PI: A. West)


  
