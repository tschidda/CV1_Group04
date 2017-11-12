using PyPlot
using JLD


# load and return the given image
function loadimage()
  img = PyPlot.imread("a1p1.png")
  return img::Array{Float32,3}
end


# save the image as a .jld file
function savefile(img::Array{Float32,3})
  JLD.save("a1p1.jld","img",img)
end


# load and return the .jld file
function loadfile()
  img = load("a1p1.jld","img")
  return img::Array{Float32,3}
end


# create and return a vertically mirrored image
function mirrorvertical(img::Array{Float32,3})
  mirrored =  Array{Float32,3}(size(img))
  mirrored[1:end, 1:end, 1:end] = img[end:-1:1, 1:end, 1:end]
  return mirrored::Array{Float32,3}
end


# display the normal and the mirrored image in one plot
function showimages(img1::Array{Float32,3}, img2::Array{Float32,3})
  figure()
  subplot(1,2,1)
  imshow(img1)
  axis("off")
  subplot(1,2,2)
  imshow(img2)
  axis("off")
return gcf()

end


#= Problem 1
Load and Display =#

function problem1()

  img1 = loadimage()

  savefile(img1)

  img2 = loadfile()

  img2 = mirrorvertical(img2)

  showimages(img1, img2)

end
