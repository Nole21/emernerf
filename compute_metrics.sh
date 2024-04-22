# $1 is the experiment dir
for metric in PSNR SSIM Masked_PSNR Masked_SSIM; do
    for scene in $(ls /opt/data/private/emernerf/experiments/$1); do
        for file in $(ls /opt/data/private/emernerf/experiments/$1/$scene/logs); do
            if [ $metric == PSNR ]
            then
                awk 'BEGIN {FS=" "}
                NR==600 {print "'$scene'",": ", $NF}
                ' /opt/data/private/emernerf/experiments/$1/$scene/logs/$file
            elif [ $metric == SSIM ]
            then
                awk 'BEGIN {FS=" "}
                NR==601 {print "'$scene'",": ", $NF}
                ' /opt/data/private/emernerf/experiments/$1/$scene/logs/$file
            elif [ $metric == Masked_PSNR ]
            then
                awk 'BEGIN {FS=" "}
                NR==603 {print "'$scene'",": ", $NF}
                ' /opt/data/private/emernerf/experiments/$1/$scene/logs/$file
            else 
                awk 'BEGIN {FS=" "}
                NR==604 {print "'$scene'",": ", $NF}
                ' /opt/data/private/emernerf/experiments/$1/$scene/logs/$file
            fi
        done
    done > /opt/data/private/emernerf/$metric.txt
done

for metric in PSNR SSIM Masked_PSNR Masked_SSIM; do
    awk 'BEGIN {FS=" ";sum=0}
    {sum+=$NF}
    END {sum/=NR; print "'$metric'", ": ", sum}
    ' /opt/data/private/emernerf/$metric.txt
    rm /opt/data/private/emernerf/$metric.txt
done





