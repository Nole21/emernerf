# script to decode tfrecord file
python preprocess.py \
    --data_root /opt/data/private/emernerf/data/waymo/raw \
    --target_dir data/waymo/processed \
    --split training \
    --process_keys images lidar calib pose dynamic_masks \
    --workers 8 \
    --scene_ids 546 581 592 620 640 700 754 795 796
    # --split_file data/waymo_splits/dynamic32.txt