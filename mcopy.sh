echo "Bash script to transfer tar files without having enter the password after each file."
echo "Requires the sshpass program. Available from macports and probably elsewhere like Home Brew."
echo "The transfer of eight files at a time is the limit on my 2018 MacBook Pro. Four or six files may be ideal."
echo "The canary.wav file is a sound file. Any sound file will do. It gives an audible indiciation that the transfer is finished."
echo "afplay is a Unix program. It might be in Mac OS X."
echo "The audible alert is very helpful and easy to add to other scripts."
for file in 1712.tar 1716.tar 1713.tar 1714.tar 1733.tar ; do
    echo "The transfer of ${file} has started."
    sshpass -p "PASSWORD" scp -r username@dtn2.oscer.ou.edu:/data/username/$file .
    echo "The transfer of ${file} has finished."
done
echo "All of your files have been transferred."
afplay ~/canary.wav
