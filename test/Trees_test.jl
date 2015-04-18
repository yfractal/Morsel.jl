module TreesTest
using FactCheck
include("../src/Trees.jl")

facts("Tree") do
    t = Tree(:root)
    insert!(t, [:a, :b, :c])

    context("ischild") do
        @fact ischild(:a, t) => true

        @fact ischild(:b, t) => false
        @fact ischild(:c, t) => false
        @fact ischild(:d, t) => false
    end

    context("getchild") do
        @fact getchild(t, :a).value => :a

        @fact getchild(t, :b) => nothing
    end

    context("search") do
        tree = Tree(:root)
        insert!(tree, [:a, :b])
        insert!(tree, [:a, :b])
        @fact tree.value => :root

        @fact tree.children[1].value => :a
    end
end

end