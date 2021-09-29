
(example)
```bash
for SCR in BATCH_SCRIPT.job*sh
do
  sbatch -o $SCR.o%j -e $SCR.e%j -N1 -n8 $SCR
  sleep 1
done
```
