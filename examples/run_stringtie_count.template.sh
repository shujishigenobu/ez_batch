module load stringtie/2.1.6

GFF=Apisum_Buchnera_ERCC_combined.gff3
NCPU=4
OUTDIR=stringtie_count

NAME={{NAME}}
BAM={{BAM}}

stringtie -e -p $NCPU -G $GFF \
  -o ${OUTDIR}/${NAME}/${NAME}.stringtie_count.gtf  \
  $BAM