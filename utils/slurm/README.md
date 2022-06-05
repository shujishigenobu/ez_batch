
(example without using arrays)
```bash
for SCR in BATCH_SCRIPT.job*sh
do
  sbatch -o $SCR.o%j -e $SCR.e%j -N1 -n8 $SCR
  sleep 1
done
```

(example with arrays)
```bash
#!/bin/bash

#SBATCH --job-name=run_salmon2.arrayjob
#SBATCH --array=1-10      # Submit 10 tasks with task ID 1,2,...,10
#SBATCH -N 1
#SBATCH -n 8

# Print the task id.
echo "My SLURM_ARRAY_JOB_ID: " $SLURM_ARRAY_JOB_ID
echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID

script=run_salmon2.job${SLURM_ARRAY_TASK_ID}.sh
echo "Running job script: ${script}"

bash ${script} \
     1>${script}.o${SLURM_ARRAY_JOB_ID}_${SLURM_ARRAY_TASK_ID} \
     2>${script}.e${SLURM_ARRAY_JOB_ID}_${SLURM_ARRAY_TASK_ID}
```
