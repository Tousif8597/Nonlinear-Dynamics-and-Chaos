using Plots

σ = 10.0
ρ = 28.0
β = 8/3

dt = 0.005
eps = 1e-3
N = 4500

x = ones(N) .+ eps .* randn(N)
y = ones(N) .+ eps .* randn(N)
z = ones(N) .+ eps .* randn(N)

anim = Animation()

for i in 1:4000
    dx = σ .* (y .- x)
    dy = x .* (ρ .- z) .- y
    dz = x .* y .- β .* z

    x .+= dx .* dt
    y .+= dy .* dt
    z .+= dz .* dt

    if i > 1500
        scatter(x, y, z;
            markersize = 0.36,
            color = :green,
            label = false,
            xlims = (-25, 25),
            ylims = (-35, 35),
            zlims = (0, 50),
            title = "Lorenz cloud evolution")
        frame(anim)
    end
end

mp4(anim, "lorenz_cloud.mp4", fps = 30)
