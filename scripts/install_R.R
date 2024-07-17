fun_install_git <- function(remote_git_id,local_git_dir,ref='master') {
    tryCatch(
        expr = {
            cat('install from github ', remote_git_id,'\n')
            cat('remotes::install_github(',remote_git_id,',',ref,',quiet = TRUE)','\n')
            remotes::install_github(remote_git_id,ref,quiet = FALSE)
        },
        error = function(e) {
            cat('install using pre-downloaded ',remote_git_id,'\n')
            cat('remotes::install_local(',local_git_dir,')','\n')
            remotes::install_local(local_git_dir,quiet = FALSE,local = TRUE,dependencies=FALSE)
        }
    )
}

fun_install_local <- function(remote_git_id,local_data,ref = 'master') {
    tryCatch(
        expr = {
            cat('install from github ', remote_git_id,'\n')
            cat('remotes::install_github(',remote_git_id,',',ref,',quiet = TRUE)','\n')
            remotes::install_github(remote_git_id, ref = ref,quiet = FALSE)
        },
        error = function(e) {
            cat('install using pre-downloaded ', remote_git_id,'\n')
            cat('install.packages(',local_data,')','\n')
            install.packages(local_data,repos = NULL,quiet = FALSE,local=TRUE)
        }
    )
}

# data manipulation
# install.packages('tidyverse')
install.packages('BiocManager')
install.packages('remotes')
install.packages('devtools')

# data visualization
visual_tools  <- c('ggthemes','ggplot2','ggrepel','patchwork','scales','gridExtra','cowplot','ggpubr')
install.packages(visual_tools)

# bioinformatical tools
bioinfo_tools = c('clusterProfiler','org.Hs.eg.db','DESeq2','limma','edgeR','BSgenome.Hsapiens.UCSC.hg38')
BiocManager::install(bioinfo_tools, update = FALSE, ask = FALSE)

# visualization
visual_tools2 = c("Rcolorbrewer","pheatmap","ComplexHeatmap",'circlize')
BiocManager::install(visual_tools2, update = FALSE, ask = FALSE)

# pckage required for seurate
seurat_required_tools = c('glmGamPoi','EnsDb.Hsapiens.v86', 'JASPAR2020', 'SeuratDisk', 'TFBSTools','hdf5r')
BiocManager::install(seurat_required_tools)

# install packages with versions
remotes::install_version(package = 'Seurat', version = package_version('5.1.0'))
remotes::install_version(package = 'Signac', version = package_version('1.13.0'))

# install using pre-downloaded 
ref = 'seurat5'
fun_install_git(remote_git_id = 'mojaveazure/seurat-disk',local_git_dir = '/home/rstudio/resources/seurat-disk/')
fun_install_git(remote_git_id = 'satijalab/seurat-data',ref = ref, local_git_dir = '/home/rstudio/resources/seurat-data/')
fun_install_local(remote_git_id = 'satijalab/azimuth',ref = ref, local_data = '/home/rstudio/resources/azimuth_v0.5.0.tar.gz')
fun_install_git(remote_git_id = 'satijalab/seurat-wrappers',ref = ref, local_git_dir = '/home/rstudio/resources/seurat-wrappers/')
