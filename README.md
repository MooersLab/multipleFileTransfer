![version](https://img.shields.io/static/v1?label=multipleFileTranser&message=0.5&color=brightcolor)
[![license: mit](https://img.shields.io/badge/license-mit-blue.svg)](https://opensource.org/licenses/mit)

# Transfer multiple files by scp without repeated manual password entry

*Problem:* transferring multiple tar files from a remote computer can be laborious because you are asked to enter your password after each file transfer. 

This solution requires making an authentication key using the program *sshpass*.

1. Generate an authentication key. You should use a short passphrase when prompted for one.
```bash
ssh-keygen -t rsa -b 4096
```
2. Copy the authentication key to the remote server(s).
```bash
ssh-copy-id bmooers@schooner2.oscer.ou.edu:/home/bmooers
```
3. You will be prompted for the passphrase the next time you use `ssh` to log in or `scp` to transfer files. The prompt with scp will occur just once instead of the number of times corresponding to the list's files.


The above steps are done only once. 
The steps below must be done at the start of a session of multiple file transfers. 
You will have to enter your passphrase only once. 
Due to ethernet instability, you may have to limit the amount of tar files transferred at a time to a quarter TB.

4. Enter: `eval "$(ssh-agent -s)"`
5. Enter: `ssh-add ~/.ssh/id_rsa`


Store the following two functions in your `.zshrc` or `.bashrc`.
This first function is for putting file(s) onto the OURdisk.

```bash
function dtn2mput {
print "Enter the next two lines once for a day of transfers, then you can run this script multiple times with different batches of files."
printf 'eval "$(ssh-agent -s)"'
printf 'ssh-add ~/.ssh/id_rsa'
if [ $# -lt 1 ]; then
 echo 1>&2 "$0: not enough arguments. Need one filename or a list of two or more separated by whitespaces."
 echo "Usage1: smbmget fileName1 fileName2"
 echo "Note the dropped leading forward slash"
 return 2
fi
destination="/ourdisk/hpc/bmooers/bmooers/dont_archive"
  for file in "$@"; do
    echo "Put '$file' to dtn2."
    scp -i ~/.ssh/id_rsa -pr "$file" bmooers@dtn2.oscer.ou.edu:"$destination"/.
  done
echo "All done."  
echo "Function stored in ~/.bashFunctions3."
# Call the function with the list of files "$@" to be transferred to OURdisk computer.  
}
```

This second function is for getting file9(s) from OURdisk.

```bash
function dtn2mget {
printf "Enter the next two lines once for a day of transfers, then you can run this script mutliple times with different batches of files."
printf 'eval "$(ssh-agent -s)"'
printf 'ssh-add ~/.ssh/id_rsa'
if [ $# -lt 1 ]; then
 echo 1>&2 "$0: not enough arguments. Need one filename or a list of two or more separated by whitespaces."
 echo "Usage1: dtn2mget fileName1 fileName2"
 return 2
fi
source="/data/bmooers"
  for file in "$@"; do
    echo "Fetch '$file' from dtn2."
    scp -i ~/.ssh/id_rsa -pr mooers@smbcopy.slac.stanford.edu:"$source"/"$file" .
  done
echo "All done."  
echo "Function stored in ~/.bashFunctions3."
# Call the function with the list of files "$@" to be transferred from OURdisk computer.  
}
```

6. Enter `dtn2mput file1.tar file2.tar file3.tar file4.tar` and so on. Note the use of whitespaces to separate the files.



## Update History

|Version      | Changes                                         | Date            |
|:-----------:|:-----------------------------------------------:|:---------------:|
| Version 0.3 |  Fixed typos in README.md                       | 2024 April 10   |
| Version 0.4 |  Added Solution 1.                              | 2024 August 13  |
| Version 0.5 |  Revised dramatically.                          | 2025 January 12 |

## Sources of funding

- NIH: R01 CA242845
- NIH: R01 AI088011
- NIH: P30 CA225520 (PI: R. Mannel)
- NIH P20GM103640 and P30GM145423 (PI: A. West)


  
