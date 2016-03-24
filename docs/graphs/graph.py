#!/usr/bin/python

# The purpose of this script is to create a graph that shows the processes
# involved for the user.

from graphviz import Digraph

# Node properties
font = "verdana"

envNodeProps = {"shape": "egg", "fontname": font, "fillcolor": "forestgreen",
                "margin": "0.1, 0.1", "style": "filled"}
machNodeProps = {"fontname": font, "fillcolor": "skyblue", "style": "filled"}
graphProps = {"fontname": font}

# Create user graph.
userGraphName = "User"
userGraphColour = "lightpink1"
userGraph = Digraph(name="user")
userGraph.body.append("label = \"{}\"".format(userGraphName))
userGraph.body.append("style = filled")
userGraph.body.append("fillcolor = {}".format(userGraphColour))

# Define user graph nodes and edges.
outputEnv = "Output Environment\n(at atlas.hashicorp.com)"
userMach = "User's Virtual\nMachine"
userGraph.node(outputEnv, **envNodeProps)
userGraph.node(userMach, **machNodeProps)
userGraph.edge(outputEnv, userMach, "Manager and\nProvider Creates",
               {"color": "blue", "fontname": font})

# Create developer graph.
devGraphName = "Developer"
devGraph = Digraph(name="dev")

# Define developer graph nodes and edges.
inputEnv = "Input\nEnvironment"
devMach = "Developer's\nVirtual Machine"
devGraph.node(outputEnv, **envNodeProps)
devGraph.node(inputEnv, **envNodeProps)
devGraph.node(devMach, **machNodeProps)
devGraph.edge(inputEnv, devMach, "Manager and\nProvider Creates",
              {"color": "blue", "fontname": font, "rank": "same"})
devGraph.edge(devMach, devMach, "Provisioner\nProvisions",
              {"color": "red", "fontname": font})
devGraph.edge(devMach, outputEnv, "Manager\nPackages",
              {"color": "purple", "fontname": font})

# Combine and print graphs.
masterGraph = Digraph(name="user-dev-graph", graph_attr=graphProps)
masterGraph.subgraph(userGraph)
masterGraph.subgraph(devGraph)
masterGraph.render(cleanup=True)
