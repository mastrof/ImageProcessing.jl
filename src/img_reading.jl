export readtiff

function readtiff(fname::AbstractString;
    rotate=true, T=Float64, kwargs...
)
    if rotate
        rotr90(T.(TiffImages.load(fname; kwargs...)))
    else
        T.(TiffImages.load(fname; kwargs...))
    end
end
