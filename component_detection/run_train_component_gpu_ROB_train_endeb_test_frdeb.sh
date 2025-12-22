#!/bin/bash
#SBATCH --job-name=XR-EN-testFRDEB # Name of the job
#SBATCH --output=RoBERTa_TRAIN_endeb_TEST_frdeb_%j.log # Standard output log (%j will be replaced by job ID)
#SBATCH --error=RoBERTa_TRAIN_endeb_TEST_frdeb_%j.err # Standard error log
#SBATCH --ntasks=1 # Number of tasks (usually 1 for single-script jobs)
#SBATCH --cpus-per-task=4 # Number of CPU cores per task
#SBATCH --mem=50G # Memory allocation (adjust according to your needs)
#SBATCH --time=03:00:00 # Maximum runtime (adjust if needed)
#SBATCH --gres=gpu:1                    # Request 1 GPU
##SBATCH -N 1



CUDA_LAUNCH_BLOCKING=1
echo $CUDA_VISIBLE_DEVICES

# ACTIVATE VIRTUAL ENVIRONMENT
conda init
conda activate myenv

# SELECT TASK

# 1) SEQUENCE TAGGING
export TASK_NAME=seqtag
export MODELTYPE=xlm-roberta

# PATH TO TRAINING DATA
export DATA_DIR=train_EN-ElDeb_test_FrenchPolArg

# MAXIMUM SEQUENCE LENGTH
export MAXSEQLENGTH=10
export OUTPUTDIR=TEST-RoBERTa_TRAIN_ENdeb_TEST_FrenchPolArg_$TASK_NAME+$MAXSEQLENGTH+_BEST/


# SELECT MODEL FOR FINE-TUNING

export MODEL=xlm-roberta-base


python train_metricsontest.py \
  --model_type $MODELTYPE \
  --model_name_or_path $MODEL \
  --output_dir $OUTPUTDIR \
  --task_name $TASK_NAME \
  --do_train \
  --do_eval \
  --do_lower_case \
  --data_dir $DATA_DIR \
  --max_seq_length $MAXSEQLENGTH \
  --overwrite_output_dir \
  --per_gpu_train_batch_size 32 \
  --learning_rate 7e-5 \
  --num_train_epochs 10.0 \
  --save_steps 1000 \
  --overwrite_cache 
