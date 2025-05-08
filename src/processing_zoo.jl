export sharpen

"""
    sharpen(img; α=1.05, σ=1.0, w=3)
Sharpen image by performing the following operations:
1. binary filter with threshold `α` above median(img)
2. gaussian smoothing with standard deviation `σ`
3. erode with diamond half-size `r`
"""
function sharpen(img::AbstractMatrix;
    α::Real=1.05, σ::Real=1, w::Integer=3
)
    med = median(img)
    proc = [u > α*med ? one(u) : zero(u) for u in img]
    proc = imfilter(proc, Kernel.gaussian(σ))
    # proc = mapwindow(minimum, proc, (w,w))
    proc = erode(proc; r=w)
    proc
end
