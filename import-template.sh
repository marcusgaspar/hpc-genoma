#!/bin/bash

template_name="Slurm-Genoma5"
template_file="/anf-vol1/genomica/hpc-genoma/genomica-proj/templates/slurm-genoma-template-login-node.txt"

echo "Importing template $template_name from $template_file"

# Import template
cyclecloud import_template $template_name -f $template_file --force

echo "Template $template_name imported"	
