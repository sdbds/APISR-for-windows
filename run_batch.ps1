$input_dir="F:\\input"
$store_dir="F:\\output"
$weight_path="./pretrained/2x_APISR_RRDB_GAN_generator.pth"
$scale=2
$model="RRDB"
$float16_inference=1

Set-Location $PSScriptRoot
.\venv\Scripts\activate

$Env:HF_HOME = "./huggingface"
$Env:XFORMERS_FORCE_DISABLE_TRITON = "1"
$Env:PYTHONPATH = $PSScriptRoot
$Env:HF_ENDPOINT = "https://hf-mirror.com"
$ext_args = [System.Collections.ArrayList]::new()

if ($float16_inference) {
  [void]$ext_args.Add("--float16_inference=True")
}

python.exe "test_code/inference.py" `
--input_dir=$input_dir `
--weight_path=$weight_path `
--store_dir=$store_dir `
--scale=$scale `
--model=$model $ext_args