# Transfer multiple files by scp without repeated manual password entry

*Problem:* the transfer of mulitple tar files from a remote computer can be laborious. 
This script eases this task.

The bash script `mcopy.sh` above does not require the repeated entry of your password after each file is tranferred.
It uses the Unix program sshpass to pass your password to the program scp.
The script does the file transfers sequentially. 

The script loops over a list of files.
The script reports to the terminal when the transfer of a file has started and when it has completed.
Edit to use any wav file to report an audiable alert when the transfers are finished.
I used the canary.wav file but any wav file that you find on the web should work.

- Replace PASSWORD with your password. Keep the double quotes around your password.
- Enter a list of tar files to transfer on the line starting with `for`. 
- The list is whitespaced separated.
- The length of the list depends on the speed of your network, the stabilitiy of the connection, and the size of the files.
- In general, the transfer of 100 GB of tar files takes about an hour.
- Make executable: chmod a+x mcopy.sh.
- Enter `./mcopy.sh` in the destination folder.
- Should work for transfers from OSU and OU supercomputers and SSRL.
