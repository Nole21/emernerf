# $1 is the experiment dir
psnr=0
ssim=0
masked_psnr=0
masked_ssim=0
count=0
for scene in $(ls $1);do
    count=$count+1
    for log in /opt/data/private/emernerf/experiments/$1/$scene/logs;do
        awk  -v psnr=$psnr ssim=$ssim masked_psnr=$masked_psnr masked_ssim=$masked_ssim'
        {BEGIN FS=" "}
        /PSNR:/ && NR>=600 {psnr+=$NF}  
        /SSIM:/ && NR>=600 {ssim+=$NF)}
        /Masked PSNR:/ && NR>=600 {masked_psnr+=$NF}
        /Masked SSIM:/ && NR>=600 {masked_ssim+=$NF}
        ' /opt/data/private/emernerf/experiments/$1/$scene/logs/$log
    done
done


