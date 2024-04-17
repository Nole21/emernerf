python preprocess.py \
    --data_root /opt/data/private/emernerf/data/waymo/raw \
    --target_dir data/waymo/processed \
    --split training \
    --process_keys images lidar calib pose dynamic_masks \
    --workers 4 \
    --scene_ids 1 \
    # --split_file data/waymo_splits/dynamic32.txt