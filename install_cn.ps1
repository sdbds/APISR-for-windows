Set-Location $PSScriptRoot

$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1
$Env:PIP_INDEX_URL = "https://mirror.baidu.com/pypi/simple"
$Env:HF_ENDPOINT = "https://hf-mirror.com"

if (!(Test-Path -Path "venv")) {
    Write-Output  "创建python虚拟环境venv..."
    python -m venv venv
}
.\venv\Scripts\activate

Write-Output "安装依赖..."
pip install torch==2.1.1+cu118 torchvision==0.16.1+cu118 torchaudio==2.1.1+cu118 -f https://mirror.sjtu.edu.cn/pytorch-wheels/torch_stable.html

pip install -U -r requirements-windows.txt

pip install pyiqa==0.1.7 --no-deps

pip uninstall tb-nightly tensorboard tensorflow-estimator tensorflow-gpu tf-estimator-nightly

pip install tensorflow

wget https://github.com/Kiteretsu77/APISR/releases/download/v0.1.0/4x_APISR_GRL_GAN_generator.pth -o pretrained/4x_APISR_GRL_GAN_generator.pth

wget https://github.com/Kiteretsu77/APISR/releases/download/v0.1.0/2x_APISR_RRDB_GAN_generator.pth -o pretrained/2x_APISR_RRDB_GAN_generator.pth
Write-Output "安装完毕"
Read-Host | Out-Null ;
