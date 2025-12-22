#!/bin/bash
#SBATCH --job-name=train # Name of the job
#SBATCH --output=tra-elecdeb-fr-train_%j.log # Standard output log (%j will be replaced by job ID)
#SBATCH --error=tra-elecdeb-fr-train_%j.err # Standard error log
#SBATCH --ntasks=1 # Number of tasks (usually 1 for single-script jobs)
#SBATCH --cpus-per-task=4 # Number of CPU cores per task
#SBATCH --mem=25G # Memory allocation (adjust according to your needs)
#SBATCH --time=5:00:00 # Maximum runtime (adjust if needed)
#SBATCH --gres=gpu:1                    # Request 1 GPU
##SBATCH -N 1


python translate_fr.py --data_path='translated_opus-mt_TRAIN.txt' --save_translation_file='translated_opus-mt_TRAIN.txt' --target_language='en' --model='opus-mt'
