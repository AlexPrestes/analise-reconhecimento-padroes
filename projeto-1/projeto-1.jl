using DelimitedFiles
using DataFrames
using Plots

gr(size = (200, 200))

function read_files()
  directory = "dados"
  dados = Array{Float64, 2}(undef,500,20)

  for i in 1:20
    fn = "dados_ "*string(i)
    dados[:,i] = readdlm(directory*"/"*fn, header=true, Float64)[1][:,2]
  end

  return dados
end

dados = read_files()
df = DataFrame(dados, :auto)
dados_label = reshape(string.("dados ", 1:20), (1, 20))

histogram(dados[:,1:10], bins=20, layout = (5,2), title = dados_label[:,1:10], legend = false)
savefig("hist_1-10.png")