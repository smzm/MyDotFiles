#!/bin/bash 

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

Cof='\033[0m'             # Reset



archive(){
   echo -e "${Blue}======================================= archive - compress =======================================${Cof}

    [1]    tar     ${Green}===>   Archive utility${Cof}
    [2]    gzip    ${Green}===>   Compression with gzip${Cof}
    [3]    gunzip  ${Green}===>   Extracting gzip filesq${Cof}
    [4]    bzip2   ${Green}===>   Compression with bzip2 algorithm${Cof}
     "     
}

files(){
    echo -e "${Blue}=========================================== files ================================================${Cof}
        
    [1]    ls       ${Green}===>   Display all information about files and directory${Cof}
    [2]    pwd      ${Green}===>   Show the path of current directory${Cof}
    [3]    cat      ${Green}===>   Place standard input into file${Cof}
    [4]    mkdir    ${Green}===>   Create 'temp' directory${Cof}
    [5]    rm       ${Green}===>   Remove a file${Cof}
    [6]    cp       ${Green}===>   Copy a file to another file${Cof}
    [7]    mv       ${Green}===>   Move a file (used for RENAMING)${Cof}
    [8]    ln       ${Green}===>   Create link to 'file-name'${Cof}
    [9]    unlink   ${Green}===>   unlink a link${Cof}
    [10]   more     ${Green}===>   Output content of 'file'${Cof}
    [11]   head     ${Green}===>   Output first 10 lines of 'file'${Cof}
    [12]   tail     ${Green}===>   Output last 10 lines of 'file'${Cof}
    [13]   gpg      ${Green}===>   Encrypt file${Cof}
    [14]   gpg      ${Green}===>   Decrypt file${Cof}
    [15]   wc       ${Green}===>   Print the number of bytes, word and lines in file${Cof}
    [16]   xargs    ${Green}===>   Reads input from stdin and uses them as arguments${Cof}
    [17]   tee      ${Green}===>   Read from stdin and write on stdout and also duplicate its input${Cof}
    [18]   sort     ${Green}===>   Sort inputs${Cof}
    [19]   uniq     ${Green}===>   Remove dupicate entries from inputs${Cof}
    [20]   cut      ${Green}===>   Cut a coloumn of a file${Cof}
    [21]   paste    ${Green}===>   Paste lines from two or more files side by side ${Cof}
    [22]   join     ${Green}===>   Join files based on matching field(file should be sorted)${Cof}
    [23]   file     ${Green}===>   Identity of a file${Cof}
    [24]   metacharacters  | & ; ( ) < > *${Cof}
        "        
} 

hardware(){
    echo -e "${Blue}========================================= hardware and disk ==========================================${Cof}
       
    [1]    dmesg                 ${Green}===>   Detect hardware and boot message${Cof}
    [2]    lshw                  ${Green}===>   Display information on hardware configuration of the system${Cof}
    [3]    lsblk                 ${Green}===>   Display block device related information in linux${Cof}
    [4]    lspci                 ${Green}===>   Show PCI Devices (-t for showing as a tree) (-v for verbose)${Cof}
    [5]    lsusb                 ${Green}===>   Show USB Devices (-t for showing as a tree) (-v for verbose)${Cof}
    [6]    lsmem                 ${Green}===>   List range of available memory${Cof}
    [7]    free -m               ${Green}===>   Used and free memory (-m for Megabyte)${Cof}
    [8]    dmidecode             ${Green}===>   Show hardware info from the BIOS ${Cof}
    [9]    hdparam -i  /dev/sda  ${Green}===>   Show information about disk <sda> ${Cof}
    [10]   hdparam -tT /dev/sda  ${Green}===>   Do a read speed test on disk <sda>${Cof}
    [11]   badblocks -s /dev/sda ${Green}===>   Test for unreadable blocks on disk sda${Cof}
    [12]   mount                 ${Green}===>   mount a file system${Cof}
    [13]   unmount               ${Green}===>   unmount a file system${Cof}
    [14]   eject                 ${Green}===>   Eject Removable media${Cof}
    [15]   blkid                 ${Green}===>   Show UUID of a hardware${Cof}
    [16]   df -h                 ${Green}===>   Show free space on mounted filesystems${Cof}
    [17]   df -i                 ${Green}===>   Show free inodes on mounted filesystems${Cof}
    [18]   fdisk -l              ${Green}===>   Show disks partitions sizes and types${Cof}
    [19]   du -ah                ${Green}===>   Display disk usage in human readable form${Cof}
    [20]   du -sh                ${Green}===>   Display total disk usage on the current directory${Cof}
    [21]   mkfs                  ${Green}===>   Make file system${Cof}
    [22]   debugfs               ${Green}===>   Debuging file system${Cof}
    [23]   quota                 ${Green}===>   Setup a disk quota for a file system${Cof}
           /proc/cpuinfo         ${Green}===>   CPU model${Cof}
           /proc/meminfo         ${Green}===>   Hardware Memory${Cof}
           /proc/interrupts      ${Green}===>   List the number of interrupts per CPU per I/O device${Cof}
           /proc/filesystems     ${Green}===>   File-system Information being used currently
           /proc/swaps           ${Green}===>   Swap File Information
           /etc/fstab            ${Green}===>   Information of Disk Drive and their mount point${Cof}
   " 
   }

users(){
    echo -e "${Blue}============================================= users and permission  ===============================================${Cof}
      
    [1]    useradd               ${Green}===>   Create user 'sid'${Cof}
    [2]    groupadd              ${Green}===>   Add group 'admin' (/etc/group)${Cof}
    [3]    userdel               ${Green}===>   Delete user 'sid'${Cof}
    [4]    groupdell             ${Green}===>   Delete group 'admin'${Cof}
    [5]    usermod               ${Green}===>   Modify user information${Cof}
    [6]    chgrp                 ${Green}===>   Change group of a file ${Cof}
    [7]    adduser               ${Green}===>   Add user 'sid'${Cof}
    [8]    passwd                ${Green}===>   Update a user password (/etc/passwd) ${Cof}
    [9]    chage                 ${Green}===>   Change user password expiry information (/etc/shadow)${Cof}
    [10]   wall                  ${Green}===>   Send a message to users${Cof}
    [11]   write                 ${Green}===>   Send a message to specific user${Cof}
    [12]   whoami                ${Green}===>   Who is the user logged in${Cof}
    [13]   umask                 ${Green}===>   Permission of a new file${Cof}
    [14]   chmod                 ${Green}===>   Set rwx permission for user, group and other${Cof}
    [15]   chown                 ${Green}===>   Change user owner and group owner of a file or directory${Cof}
    [16]   last                  ${Green}===>   Displays a list of last logged in users${Cof}
    [17]   w                     ${Green}===>   Show who is logged on and what they are doing ${Cof}
    [18]   visudo                ${Green}===>   Edit the sudoers file ${Cof}
    [19]   ulimit                ${Green}===>   Get and set user limits ${Cof}
           /etc/passwd           ${Green}===>   Contains password of system users in a shadow file, a security implementation${Cof}
           /etc/group            ${Green}===>   Information of Security Group${Cof}
           /etc/motd             ${Green}===>   Stands for Message Of The Day, The Message users gets upon login${Cof}
     "
}   
    
process(){
        echo -e "${Blue}=========================================== process ===============================================${Cof}  
      
    [1]    ps                      ${Green}===>   Display your currently active processes${Cof}
    [2]    ps aux | grep 'telnet'  ${Green}===>   Find all process id related to telnet process${Cof}
    [3]    pmap                    ${Green}===>   Memory map of process${Cof}
    [4]    top(htop)               ${Green}===>   Display all running processes${Cof}
    [5]    kill                    ${Green}===>   Control processes by sending signals${Cof}
    [6]    killall <pr>            ${Green}===>   Kill all process named 'pr'${Cof}
    [7]    bg                      ${Green}===>   Lists stopped or background jobs${Cof}
    [8]    fg %<n>                 ${Green}===>   Brings the most recent  job to foreground${Cof}
    [9]    init                    ${Green}===>   Process control initialization ${Cof}
    [10]   crontab                 ${Green}===>   Time-based job scheduler( root crontab --> /etc/cron*)${Cof}
    [11]   at                      ${Green}===>   set a job execute ${Cof}
    [12]   nohup                   ${Green}===>   Run commands even after logged out${Cof}
    [13]   nice                    ${Green}===>   How nice the process is with CPU (-20<n<20)${Cof}
    [14]   renice                  ${Green}===>   Change niceness of running process${Cof}
    "
}

network(){
    echo -e "${Blue}========================================== network ================================================${Cof}
      
     [1]   ifconfig -a             ${Green}===>   Display all network ports and ip address${Cof}
     [2]   ifconfig eth0           ${Green}===>   Display specific ethernet status${Cof}
     [3]   ethtool eth0            ${Green}===>   Linux tool to show ethernet status${Cof}
     [4]   ping <host>             ${Green}===>   Send echo request to test connection${Cof}
     [5]   traceroute              ${Green}===>   Network diagnostic tool ${Cof}
     [6]   whois <domain>          ${Green}===>   Get who is information for a 'domain'${Cof}
     [7]   dig <domain>            ${Green}===>   Get DNS information for a domain${Cof}
     [8]   dig -x <host>           ${Green}===>   Reverse lookup host${Cof}
     [9]   host <google.com>       ${Green}===>   Lookup DNS ip address for 'google.com'${Cof}
     [10]  hostname -i             ${Green}===>   Lookup local ip address${Cof}
     [11]  wget <file>             ${Green}===>   Download <file>${Cof}
     [12]  netstat -tulpn          ${Green}===>   List active connection to/from system${Cof}
     [13]  netstat -nr             ${Green}===>   Displaye routing table in numerical form (route)${Cof}
     [14]  netstat -na             ${Green}===>   Displays all connections and listening ports${Cof}
     [15]  ftp                     ${Green}===>   File transfer protocol${Cof}
     [16]  ufw                     ${Green}===>   Firwall in linux${Cof}
     [17]  nc                      ${Green}===>   Netcat design for reading from and writing to network connections using TCP or UDP${Cof}
     [18]  tcpdump -I <enp>        ${Green}===>   Display TCP/IP and other packets to which the computer is attached${Cof}
     [19]  lsof -i                 ${Green}===>   Find the process that opened a local internet port  ${Cof}
     [20]  fuser                   ${Green}===>   Display process IDs currently using files or process on specific port${Cof}
     [21]  nmap                    ${Green}===>   Security Scanner, Port Scanner, & Network Exploration Tool (apt install nmap)${Cof}
     [22]  ss                      ${Green}===>   Utility to investigate sockets ${Cof}
     [24]  ip                      ${Green}===>   Show / manipulate routing, network devices, interfaces and tunnels ${Cof}
           /etc/resolv.conf        ${Green}===>   Configure dns name servers${Cof}
           /etc/hosts              ${Green}===>   Mapping of hostnames to IP addresses before DNS can be referenced${Cof}
           /etc/nsswitch.conf      ${Green}===>   Configure services to determine information such as hostnames, password files and etc${Cof}
           /etc/services           ${Green}===>   Show all port number on a standard services${Cof}
           /etc/hosts.allow        ${Green}===>   List of hosts allowed to access services on the local machine${Cof}
           /etc/hosts.deny         ${Green}===>   List of hosts denied to access services on the local machine${Cof}
           /etc/skel               ${Green}===>   Script that populates new user home directory
    " 
}

ssh(){
    echo -e "${Blue}========================================== ssh ================================================${Cof}  
          
        1- SSH Keygen --->  ~/.ssh/<id-rsa>  
             
        2- Configuration --->  /etc/ssh/sshd_config
        
        3- config keys ---> ~/.ssh/config -----------
                                                    | Host <DNS or IP-Address>
                                                    | Port 2222
                                                    | HostNmae <DNS or IP-Address>
                                                    | identityFile ~/.ssh/id_rsa_<host>
                                                    | user <user-name>
        3- give access permission 600 to autorized_key file
        4- ssh-copy-id -i <path-of-publickey> <ip-address>
        5- ssh user@host -p <port>
        log file --->  /var/log/auth.log
        ssh user@host                  ===>    Connect to host as user
        ssh -p <port> user@host        ===>    Connect to host using specific port
        scp file.txt server:/tmp       ===>    Secure copy file.txt to remote host /tmp folder
        rsync -a /home/apps /backup/   ===>    Synchronize source to destination
    "
    }

search(){
    echo -e "${Blue}============================================= search ================================================${Cof} 
      
    [1]   grep            ${Green}===>   Search for pattern in files${Cof}
    [2]   locate file     ${Green}===>   Find all instances of file${Cof}
    [3]   find            ${Green}===>   Find files names that start with 'index'${Cof}
    [4]   sed             ${Green}===>   Stream editor${Cof}
    [5]   type            ${Green}===>   Locate binary file of a command${Cof}
    [6]   whereis         ${Green}===>   Locate binary, man and source of a command${Cof}
    [7]   whatis          ${Green}===>   One line manual page${Cof}
    [8]   which           ${Green}===>   Locate a command${Cof}
    "
}

system(){
    echo -e "${Blue}=============================================== system ==============================================${Cof} 
      
    [1]   uname -a             ${Green}===>   Display linux system information ${Cof}
    [2]   uname -r             ${Green}===>   Display kernel release information${Cof}
    [3]   uptime               ${Green}===>   Show how long the system has been running + load${Cof}
    [4]   hostname             ${Green}===>   Show system hostname ${Cof}
    [5]   hostname -i          ${Green}===>   Display IP address of the host${Cof}
    [6]   lsb_release -a       ${Green}===>   LSB version${Cof}
    [7]   last reboot          ${Green}===>   Show system reboot history${Cof}
    [8]   history              ${Green}===>   How commands history${Cof}
    [9]   date                 ${Green}===>   Show the current date and time${Cof}
    [10]  cal                  ${Green}===>   Show this month calendar${Cof}
    [11]  locale               ${Green}===>   Local specific information ${Cof}
    [12]  ntpdate pool.ntp.org ${Green}===>   get exact time ${Cof}
    [13]  set time in system   ${Green}--->   ln -s /usr/share/zoneinfo/Asia/Tehran /etc/localtime${Cof}
    [14]  set                  ${Green}===>   Change options of shell${Cof}
    [15]  w                    ${Green}===>   display who is online${Cof}
    [16]  whoami               ${Green}===>   Who you are logged in${Cof}
    [17]  id                   ${Green}===>   Show the active user id with login and group${Cof}
    [18]  last                 ${Green}===>   Show last logins on the system ${Cof}
    [19]  who                  ${Green}===>   Show who is logged on the system${Cof}
    [20]  export               ${Green}===>   Display exported shell value variable${Cof}
    [21]  systemctl            ${Green}===>   Introspect and control the state of the system${Cof}
    [22]  journalctl -uf       ${Green}===>   Query the contents of the system${Cof}
    [23]  sysmctl              ${Green}===>   Configure kernel parameters at runtime${Cof}
    [24]  export               ${Green}===>   Set environmental variable ${Cof}
    [25]  unset                ${Green}===>   Unset a defined variable${Cof}
    [26]  logrotate            ${Green}===>   Management of log (/etc/logrotate.d/)${Cof}
    [27]  cups                 ${Green}===>   Configuration printers(systemctl start cups - 127.0.0.1:631 - /etc/cups/)${Cof}
    /etc/grub.conf             ${Green}===>   Grub bootloader configuration file${Cof}
    "
}

regex(){
echo -e "${Blue}================================================= regex ==================================================${Cof} 

           ----------------------------------------------------------------
           |     a * s     |   zero or more (a) with one or more (s)      |
           ----------------------------------------------------------------
           |     a + s     |   one or more (a) with one (s)               |
           ----------------------------------------------------------------
           |     a ? s     |   zero or one (a) with one or more (s)       |
           ----------------------------------------------------------------
           |    a{2,4}s    |   2 or 4 (a) with one (s)                    |
           ----------------------------------------------------------------
           |     (a|s)     |   one (a) or one (s)                         |
           ----------------------------------------------------------------
           |    .a(s|b)    |   (everything) with (a) with  (s) or (b)     |
           ----------------------------------------------------------------
           |     [a-z]     |   every character between (a) till (z)       |
           ----------------------------------------------------------------
           |  [[:alnum:]]  |   alphanumeric character                     |
           ----------------------------------------------------------------
           |  [[:blank:]]  |   space and tab                              |
           ----------------------------------------------------------------
           |  [[:digit:]]  |   0-9                                        |
           ----------------------------------------------------------------
           |  [[:upper:]]  |  uppercase character                         |
           |  [[:lower:]]  |  lowercase character                         | 
           ----------------------------------------------------------------
           |       ^       |   at the first of the string                 |
           ----------------------------------------------------------------
           |       $       |   at the end of the string                   |
           ----------------------------------------------------------------

"
}

map(){
echo -e "${Blue}================================================== map ===================================================${Cof}
    
    Ctrl + z    ${Green}===>  Sleep a program${Cof}
    Ctrl + c    ${Green}===>  Stop current command${Cof}
    Ctrl + a    ${Green}===>  Go to start of line${Cof}
    Ctrl + e    ${Green}===>  Go to end of line${Cof}
    Ctrl + u    ${Green}===>  Cut from start  of line${Cof}
    Ctrl + k    ${Green}===>  Cut to end of line${Cof}
    Ctrl + r    ${Green}===>  Search history ${Cof}
"
}

git(){
  echo -e "${Blue}================================================= git ==================================================${Cof}

        ------------------------------------------------------------------------
        ${Green}git init${Cof}                  |                  ${Green}git config${Cof}
        ------------------------------------------------------------------------
        ${Green}it ls-files${Cof}               |                  ${Green}git status${Cof}
        ------------------------------------------------------------------------
        ${Green}git add${Cof}                   |                  ${Green}git commit${Cof}
        ------------------------------------------------------------------------
        ${Green}git diff${Cof}                  |                  ${Green}git show${Cof}
        ------------------------------------------------------------------------
        ${Green}git checkout${Cof}              |                  ${Green}git branch${Cof}
        ------------------------------------------------------------------------
        ${Green}git merge${Cof}                 |                  ${Green}git fetch${Cof}
        ------------------------------------------------------------------------
        ${Green}git mv${Cof}                    |                  ${Green}git rm${Cof}
        ------------------------------------------------------------------------
        ${Green}git tag${Cof}                   |                  ${Green}git stash${Cof}
        ------------------------------------------------------------------------
        ${Green}git push${Cof}                  |                  ${Green}git remote${Cof}
        ------------------------------------------------------------------------
        ${Green}git log${Cof}                   |                  ${Green}git pull${Cof}
        ------------------------------------------------------------------------
        ${Green}git revert${Cof}                |                  ${Green}git cherry-pick${Cof}
        ------------------------------------------------------------------------
        ${Green}git reset${Cof}                 |                  ${Green}git rebase${Cof}
        ------------------------------------------------------------------------
  "
}

vim(){
   echo -e "${Blue}========================================================== vim =======================================================${Cof}


        ${Purple}-------------------------------------------------------- editing -----------------------------------------------------${Cof}
        r (replace a single character)                                  |    cc (change(replace) entire line)          | a (all)
        J (join line below to the current one with one space between    |    dd (delete(cut) entire line)              | i (in)
                                                                        |    yy (yank(copy) entire line)               | t (till)
                                                                        |    C  (change(replace) to the end of line)   | f (forward)
        p (put(paste) before cursor)                                    |    D  (delete(cut) to the end of line)       | F (backward)
        P (put(paste) after cursor)                                     |
        s (delete character and substitude text)                        |    u (undo)
        S (delete line and substitude text (same as cc) )               |    U (undo whole line)
        . (repeat last command)                                         |    Ctrl + r (redo)

        ciw (change(replace) entire word)                               |    cs\"' -->  words wrapped in \" with '
        cw  (change(replace) to the end of the word)                    |    csw[    
        c$  (change(replace) to the end of the line)                    |    cs2w(   
        x   (delete(cut) character)                                     |    yss(  
 
        ${Purple}------------------------------------------------ cursor movement -----------------------------------------------------${Cof}
        k (move cursor up)                                              |           w (jump forward to the start of next word)
        j (move cursor down)                                            |           e (jump forward to the end of next word)
        l (one character to right)                                      |           b (previous begining word)
        h (one character to left)                                       |             

        0 (jump to the start of the line)                               |           L (move to the bottom of screen) 
        $ (jump to the end of the line)                                 |           M (move to the middle of screen) 
        ^ (jump to the first non-blank character of the line)           |           H (move to the top of the screen) 
        g_ (jump to the last non-blank character of the line)           |

        gg (go to the first line of document)                           |           zz (center cursor on screen)
        G  (go to the last line of document)                            |           %  (move to matching character () {} [] )
        5G (go to the line 5 of document)

        Ctrl + e (move screen down one line)                            |           Ctrl + b (move back one full screen)
        Ctrl + y (move screen up one line)                              |           Ctrl + f (move forward one full screen)
        Ctrl + d (move forward 1/2 full screen)                         
        Ctrl + u (move back 1/2 full screen)
        
       ${Purple}---------------------------------------------- search and exiting ------------------------------------------------------${Cof}
        :w (save)                                                       |   /pattern (search for pattern)
        :q (quit)                                                       |   ?pattern (search backward for pattern)
        :q! (quit unsaved)                                              |   n (repeat search in same direction)
        :wq (save and quit)                                             |   N (repeat search in oppisite direction)
        :wqa(save and quit all tabs)                                    |   :%s/old/new/g (replace all old with new in document)
        :w !sudo tee % (write out current file with sudo)               |   :s/old/new/g (replace all old with new in line)

        ${Purple}---------------------------------------------------- visual mode ------------------------------------------------------${Cof}
        > (shift text right)                                            |   aw (mark a word)
        < (shift text left)                                             |   ab (a block with () )
        o (move to other end of marked area)                            |   aB (a block with {} )
        Ctrl + v (start visual block mode)                              |   ib (inner block with () )
        O (move to other corner of block)                               |   iB (inner block with {} )
        
        ${Purple}----------------------------------------------- marks and macros ------------------------------------------------------${Cof}
        :marks (list of marks)                                          |   qa (record macro a)
        ma (set current position of mark a)                             |   q (stop recording macro)
        \`a (jump to position a)                                         |   @a (run macro a)
        y\`a (yank text to position of mark a)                           |   @@ (rerun last run macro)

       ${Purple}----------------------------------------------------- insert mdoe ------------------------------------------------------${Cof}
        i (insert mode)                                                 |  o (append(open) a new line below the current line)
        I (Insert at the beginning of the line)                         |  O (append(open a new line above the current line))
        a (insert(append) after cursor)
        A (insert(append) at the end of the line)

        ${Purple}-------------------------------------------------- multiple file -------------------------------------------------------${Cof}
        :e file (edit a file in a new buffer)                           | :sp file  (open a file in a new buffer and split window)
        :bnext or :bn (go to the next buffer)                           | :vsp file (open a file in a new buffer and vertically split window )
        :bprev or :bp (go to the previous buffer)                       | Ctrl + ww (switch windwo)
        :bd (delete a buffer)                                           | Ctrl + ws (split window)
        :ls ( list all open buffer)                                     | Ctrl + wq (quit a window)
        
        :tabnew  or :tabnew file (open a file in a new tab)             | #gt (move to tab number #)
        gt or :tabnext or :tabn (move to the next tab)                  | :tabclose or :tabc (close the current tab and all its windwos)
        gT or :tabprev or :tabp (move to the previous tab)              | :tabonly  or :tabo (close all tabs except for the current one )

        ${Purple}------------------------------------------------------------------------------------------------------------------------${Cof}
        :earlier 2m (back to the file in 2 min ago)
        ---------------------------------------------------------------------------------------------------------------------------------
        ============================================= VSCODE =====================================
        gcc --> vim-commentary [https://github.com/VSCodeVim/Vim#vim-commentary]
        ci{ - ci[ - ci( --> vim-indent-object [https://github.com/VSCodeVim/Vim#vim-indent-object]
        
        ========vim-surround [https://github.com/VSCodeVim/Vim#vim-surround]=======
        ds --> delete existing surround
        cs --> change surround existing to desired
        ys --> surround something with something using motion
        S --> Surround when in visual mode

        ===easymotion [https://github.com/VSCodeVim/Vim#vim-easymotion]===
              <leader><leader> s <char> ---> Search character
              <leader><leader> f <char> ---> Find character forwards
              <leader><leader> F <char  ---> Find character backwards
              <leader><leader> t <char> ---> character forwards
              <leader><leader> T <char> ---> character backwards
              <leader><leader> w        ---> Start of word forwards
              <leader><leader> b        ---> Start of word backwards
              <leader><leader> l        ---> matches beginning & ending of word, camelCase, after _ and after # forwards
              <leader><leader> h        ---> matches beginning & ending of word, camelCase, after _ and after # backwards
              <leader><leader> e        ---> End of word forwards
              <leader><leader> G        ---> End of word backwards
              <leader><leader> j        ---> Start of line forwards
              <leader><leader> k        ---> Start of line backwards
              <leader><leader> / <char>... <CR>   ---> Search n-character
              <leader><leader><leader> bdw        --->  Start of word
              <leader><leader><leader> bde        --->  End of word
              <leader><leader><leader> bdjk       --->  Start of line
              <leader><leader><leader> j          --->  JumpToAnywhere

        

        vimsneak [https://github.com/VSCodeVim/Vim#vim-sneak]

    "
   
   }  

tldrRunner(){
  read -p "Number of command for more details : " num
  let num=$num+2
  $1 > /tmp/commandFile.txt
  awk '{print $2}' /tmp/commandFile.txt > /tmp/commandfile
  com=$(cat /tmp/commandfile | head -n $num | tail -n 1)
  tldr $com
}


if [[ $1 == "archive" ]] || [[ $1 == "compress" ]] ;then
    archive
    tldrRunner archive
elif [[ $1 == "files" ]]; then
    files
    tldrRunner files 
elif [[ $1 == "hardware" ]] || [[ $1 == "disk" ]]; then
    hardware
    tldrRunner hardware 
elif [[ $1 == "users" ]] || [[ $1 == "permission" ]] ; then
    users
    tldrRunner  users 
elif [[ $1 == "process" ]]; then
    process
    tldrRunner process 
elif [[ $1 == "network" ]]; then
    network
    tldrRunner network 
elif [[ $1 == "login" ]] || [[ $1 == "ssh" ]]; then
    ssh
    tldrRunner ssh
elif [[ $1 == "search" ]]; then
    search
    tldrRunner search 
elif [[ $1 == "system" ]]; then
    system
    tldrRunner system 
elif [[ $1 == "map" ]]; then
    map 
elif [[ $1 == "regex" ]]; then
    regex  
elif [[ $1 == "git" ]]; then
    git
elif [[ $1 == "vim" ]]; then
    vim
elif [[ -z $1 ]]; then
    archive
    files
    hardware
    users
    process
    network
    search
    system
    map
    regex
    git
fi

