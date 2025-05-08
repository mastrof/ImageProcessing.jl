module ImageProcessing

using TiffImages
using Images
using ImageFiltering
using StatsBase

include("img_reading.jl")
include("processing_zoo.jl")

using Requires
function __init__()
    @require GLMakie="e9467ef8-e4e7-5192-8a1a-b1aee30e663a" include("gui.jl")
end

end # module
