#!/bin/bash
#SBATCH --job-name=ann-proj-fr-test # Name of the job
#SBATCH --output=ann-proj-fr-test_%j.log # Standard output log (%j will be replaced by job ID)
#SBATCH --error=ann-proj-fr-test_%j.err # Standard error log
#SBATCH --ntasks=1 # Number of tasks (usually 1 for single-script jobs)
#SBATCH --cpus-per-task=4 # Number of CPU cores per task
#SBATCH --mem=50G # Memory allocation (adjust according to your needs)
#SBATCH --time=10:00:00 # Maximum runtime (adjust if needed)
#SBATCH --gres=gpu:1                    # Request 1 GPU
#SBATCH -N 1

python3 annotation_projection.py \
--source_test deduped_for_backalignment/train.tsv \
--target_test BACKtranslated_opus-mt_TRAIN.txt \
--output_dir /home \
--output_name BACKPROJ_opus-mt_train_simalign_TRAIN_fr \
--do_simalign