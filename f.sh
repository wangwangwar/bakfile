#!/usr/bin/sh
for mov in $(ls *.MOV); do
    mov1="./tmp/$(echo $mov).1"
    echo "$mov1"
    mdat_shift=$(hexdump -C $mov | grep mdat -m 1| awk '{print $1}')
    echo "0x""$mdat_shift"
    mdat_shift_hex="0x""$mdat_shift"
    dd if=$mov of=$mov1 bs=1024 count=$(($mdat_shift_hex/1024))
    dat_tmp=${mov:1:7}
    dat="!${dat_tmp}.DAT"
    echo $dat
    cat $mov1 $dat > "./tmp/$mov"
    echo "Finish $mov"
done
echo "Complete!"
