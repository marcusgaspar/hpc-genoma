#!/bin/bash
# filepath: c:\_repo\hpc\hpc-genoma\run_slurm_demo_job.sh

#SBATCH --job-name=hostname_delay_job  # Nome do job
#SBATCH --nodes=1                     # Número de nodes
#SBATCH --ntasks=8                    # Número de cores (tasks)
#SBATCH --time=00:02:00               # Tempo máximo de execução (hh:mm:ss)
#SBATCH --output=job_output.log       # Arquivo de saída do job
#SBATCH --error=job_error.log         # Arquivo de erro do job
#SBATCH --partition=hpc             # Partição a ser utilizada

# Imprime o hostname
echo "Executando no hostname: $(hostname)"

# Adiciona um delay de 1 minuto
sleep 60

echo "Execução concluída."