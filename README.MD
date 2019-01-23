ft.linux_64: \
  executable file of fractal

genesis.json: \
  genesis block's config file

createGenesisNode.sh:\
  startup the genesis node, this script should be run before start.sh. And after run this script, you will get the genesis node info, such as: enode://1252e4edc7d1b57326e9e5fb00fec7ab7b2fde7359e7cbd027175e90512b6dd02a327b1fbedd6f28101dd6b3dfef2b6bcc8b58e44bf2e1c671c25a3955bd79a5@[::]:3018\
Above whole string should be added to the nodes.txt which will be read by new node. New node will connect the genenis node by this node info.
