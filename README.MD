#### **ft.linux_64**:
  executable file of fractal, different release version could be download from:https://github.com/fractalplatform/fractal/releases
  
```
ft.linux_64 --help   // get help info
```
If you are familiar with go language, you could download the souce code of fractal:
https://github.com/fractalplatform/fractal, then you can compile it and get the bin file.\
Compile command:

```
~/go/src/github.com/fractalplatform/fractal$ make all
```
You could get the bin file(ft) from ./build/bin dir. In this case, we rename ft to ft.linux_64. It isn't MUST.

#### **genesis.json**: 
  genesis block's config file

#### **oneStepStartAll.sh**: 
This script includes the createGenesisNode.sh 

#### **createGenesisNode.sh**:
  startup the genesis node, this script should be run before start.sh. And after run this script, you will get the genesis node info, such as: 
  
```
enode://1252e4edc7d1b57326e9e5fb00fec7ab7b2fde7359e7cbd027175e90512b6dd02a327b1fbedd6f28101dd6b3dfef2b6bcc8b58e44bf2e1c671c25a3955bd79a5@[::]:3018
```
\
Above whole string should be added to the nodes.txt which will be read by new node. New node will connect the genenis node by this node info.

#### nodes.txt
The nodes which could be connected will written in this file. And new node will read this file then connect these nodes. The content of this file could be:
```
enode://1252e4edc7d1b57326e9e5fb00fec7ab7b2fde7359e7cbd027175e90512b6dd02a327b1fbedd6f28101dd6b3dfef2b6bcc8b58e44bf2e1c671c25a3955bd79a5@[::]:3018
enode://2252e4edc7d1b57326e9e5fb00fec7ab7b2fde7359e7cbd027175e90512b6dd02a327b1fbedd6f28101dd6b3dfef2b6bcc8b58e44bf2e1c671c25a3955bd79a6@192.168.2.11:3018
```

#### start.sh:
  startup new nodes, which will connect the genesis node. The command should be: \
  
```
start.sh nodeNum p2pPort httpPort wsPort
```

-   **nodeNum**: the node number of starting this time
-   **p2pPort**: the begining p2p port, the first new node will use the value of p2pPort, the second new node is p2pPort+1, and so on
-   **httpPort**: the begining http port, the first new node will use the value of httpPort, the second new node is httpPort+1, and so on
-   **wsPort**: the begining ws port, the first new node will use the value of wsPort, the second new node is wsPort+1, and so on.
  \
  for example: 

```
#./start.sh 5 10000 11000 12000   // it will startup 5 new nodes
```

  
#### stop.sh:
  stop the node which p2p port is specified by this script. The command should be:
  
```
stop.sh portStart portEnd
```

  the node which node is between [portStart, portEnd] will be closed.\
  for example: 

```
#./stop.sh 10000 10004   // it will close the node which p2p port between [10000, 10004]
```

