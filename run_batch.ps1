$input_dir="./__assets__/lr_inputs"
$store_dir="./__assets__/visual_results"
$weight_path="./pretrained/4x_APISR_GRL_GAN_generator.pth"

Set-Location $PSScriptRoot
.\venv\Scripts\activate

$Env:HF_HOME = "./huggingface"
$Env:XFORMERS_FORCE_DISABLE_TRITON = "1"
$Env:PYTHONPATH = $PSScriptRoot
$Env:HF_ENDPOINT = "https://hf-mirror.com"

python.exe "test_code/inference.py" --input_dir=$input_dir --weight_path=$weight_path --store_dir=$store_dir