# 31 34 35 49 53 80 84 86 89 94 96 102 111 222 323 382 402 427 438 546 581 592 620 640 700 754 795 796 
start_timestep=0
end_timestep=-1
project=nvs_affine
num_iters=25000
for scene_idx in 16 21 22 25 31 34 35 49 53 80 84 86 89 94 96 102 111 222 323 382 402 427 438 546 581 592 620 640 700 754 795 796;do
    python train_emernerf.py \
        --config_file configs/default_flow.yaml \
        --output_root /opt/data/private/emernerf/experiments \
        --project $project \
        --run_name ${scene_idx}_flow \
        data.scene_idx=$scene_idx \
        data.start_timestep=$start_timestep \
        data.end_timestep=$end_timestep \
        data.pixel_source.load_features=True \
        data.pixel_source.feature_model_type=dinov2_vitb14 \
        nerf.model.head.enable_feature_head=True \
        nerf.model.head.enable_learnable_pe=True \
        logging.saveckpt_freq=$num_iters \
        optim.num_iters=$num_iters \
        data.pixel_source.test_image_stride=10 
done
