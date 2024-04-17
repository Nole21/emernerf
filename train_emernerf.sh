scene_idx=1
start_timestep=0
end_timestep=-1
project=nvs
num_iters=25000
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